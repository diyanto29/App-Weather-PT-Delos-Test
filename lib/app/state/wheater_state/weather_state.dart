
import 'package:flutter/material.dart';
import 'package:flutter_weather_delos/app/enum/loading_enum.dart';
import 'package:flutter_weather_delos/app/remote_data/weather_remote_data.dart';
import 'package:flutter_weather_delos/app/screen/wheater/detail_weather_data.dart';
import 'package:flutter_weather_delos/core/models/wheater_data/wheater_data.dart';
import 'weather_event.dart';

class WeatherState extends ChangeNotifier with WeatherEvent {
  Future getWheaterInfo() async {
    loadingWheater = LoadingState.loading;
    await WeatherRemoteData()
        .getWheaterInfo(latitude: latitude, longitude: longitude)
        .then((value) {
      value.fold((l) => null, (res) {
        loadingWheater = LoadingState.loaded;
        listWheater!.addAll(res!);
        notifyListeners();
      });
    });
  }

  void navigateToDetail(BuildContext context, WheaterData data) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailWeatherDataView(data: data),
        ));
  }
}
