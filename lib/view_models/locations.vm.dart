import 'package:flutter/material.dart';
import '../data/remote/response/ApiResponse.dart';
import '../models/locations.dart';
import '../repository/movies/LocationRepoImp.dart';

class LocationListVM extends ChangeNotifier {
  final _myRepo = LocationRepoImp();

  ApiResponse<Locations> LocationMain = ApiResponse.loading();

  void _setLocationMain(ApiResponse<Locations> response) {
    LocationMain = response;
    notifyListeners();
  }

  Future<void> fetchLocations() async {
    _setLocationMain(ApiResponse.loading());
    _myRepo
        .getLocationList()
        .then((value) => _setLocationMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setLocationMain(ApiResponse.error(error.toString())));
  }
}
