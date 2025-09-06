import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../model/forecast_model.dart';
import '../model/weather_model.dart';
import '../utils/session_manager.dart';
import 'api/api_client.dart';
import 'api/api_config.dart';
import 'location_service.dart';

class ForecastService extends StateNotifier<List<WeatherModel>?> {
  final ApiClient apiClient;

  ForecastService({required this.apiClient}) : super(null);

  final LocationService _locationService = LocationService();
  late Position currentLocation;

  Future<void> getGeoLocation() async {
    Position? position = await _locationService.getLatLong(
      permissionForce: true,
    );
    currentLocation = position!;
  }

  Future<void> fetchForecast({
    Position? position,
    String? lat,
    String? long,
  }) async {
    final response = await apiClient.getData(
      ApiConfig.forecastUrl,
      query: {
        'lat': lat ?? position?.latitude.toString(),
        'lon': long ?? position?.longitude.toString(),
        'appid': ApiConfig.apiKey,
      },
    );
    try {
      if (response.statusCode == 200) {
        ForecastModel forecastModel = forecastModelFromJson(response.body);
        state = forecastModel.list;
      }
    } catch (_) {
    } finally {}
  }
}
