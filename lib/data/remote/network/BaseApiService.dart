abstract class BaseApiService {
  final String baseUrl = "";

  Future<dynamic> getResponse(String url);
}
