import 'package:flutter_weather_delos/app/enum/loading_enum.dart';
import 'package:flutter_weather_delos/core/models/wheater_data/wheater_data.dart';

class WeatherEvent {
  List<WheaterData>? listWheater = [];

  double latitude = -6.175115064391812;
  double longitude = 106.82708842419382;

  LoadingState loadingWheater = LoadingState.initialize;
}
