import 'package:flutter/material.dart';
import 'package:flutter_weather_delos/app/constant/app.dart';
import 'package:flutter_weather_delos/core/models/wheater_data/wheater_data.dart';
import 'package:intl/intl.dart';
import '../../constant/endpoint.dart';

class DetailWeatherDataView extends StatelessWidget {
  final WheaterData data;
  const DetailWeatherDataView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppConstant.titleWeatherDetail),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                DateFormat.yMMMMEEEEd().format(DateTime.parse(data.dtTxt!)),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Center(
              child: Text(
                DateFormat().add_jm().format(DateTime.parse(data.dtTxt!)),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 2,
                    child: Text(
                      '${(data.main!.temp! - 273.15).floorToDouble()} °C',
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )),
                Flexible(
                  flex: 1,
                  child: Image.network(
                      '${EndPoint.urlImmage}${data.weather![0].icon}@4x.png'),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                '${data.weather![0].main}( ${data.weather![0].description} )',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Temp (min)',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${(data.main!.tempMin! - 273.15).floorToDouble()} °C',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Temp (max)',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${(data.main!.tempMax! - 273.15).floorToDouble()} °C',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
