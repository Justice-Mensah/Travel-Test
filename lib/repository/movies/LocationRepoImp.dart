import '../../constants/app_routes.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';
import '../../models/locations.dart';
import 'LocationRepo.dart';

class LocationRepoImp implements LocationRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<Locations?> getLocationList() async {
    try {
      dynamic response =
          await _apiService.getResponse(AppRoutes.locationsRoute);
      final jsonData = Locations.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }
}
