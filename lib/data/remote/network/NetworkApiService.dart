import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:traveling/data/remote/network/BaseApiService.dart';

import '../AppException.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      String basicAuth = 'Basic dml0ZWNkZXY6TTQ4OnRed1VCZSV5';
      String url = 'http://142.93.106.105/interview/getRoutes.php';

      final response = await http.Client().get(
        Uri.parse(url),
        headers: {'authorization': basicAuth},
      );
      responseJson = returnResponse(response);

      log('Request: ${response.body}');
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
