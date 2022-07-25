import 'package:flutter/material.dart';
import 'package:flutter_weather_delos/app/constant/app.dart';
import 'package:flutter_weather_delos/app/enum/loading_enum.dart';
import 'package:flutter_weather_delos/app/screen/wheater/widgets/card_list_weather.dart';
import 'package:flutter_weather_delos/app/state/wheater_state/weather_state.dart';
import 'package:provider/provider.dart';

class WheaterListView extends StatefulWidget {
  const WheaterListView({Key? key}) : super(key: key);

  @override
  State<WheaterListView> createState() => _WheaterListViewState();
}

class _WheaterListViewState extends State<WheaterListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppConstant.titleApp),
      ),
      body: Consumer<WeatherState>(
        builder: (context, value, child) {
          if (value.loadingWheater == LoadingState.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (value.loadingWheater == LoadingState.error) {
            return Center(
              child: Text(AppConstant.erorrApi),
            );
          } else if (value.listWheater!.isEmpty) {
            return Center(
              child: Text(AppConstant.dataNotFound),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () => value.getWheaterInfo(),
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                padding: const EdgeInsets.all(16),
                itemCount: value.listWheater!.length,
                itemBuilder: (c, i) {
                  var data = value.listWheater![i];
                  return CardListWeather(
                    data: data,
                    onPressed: () => value.navigateToDetail(context, data),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
