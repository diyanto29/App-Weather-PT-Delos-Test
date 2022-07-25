import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/models/wheater_data/wheater_data.dart';
import '../../../constant/endpoint.dart';

class CardListWeather extends StatelessWidget {
  const CardListWeather({
    Key? key,
    required this.data, required this.onPressed,
  }) : super(key: key);

  final WheaterData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: EdgeInsets.zero,
      leading: Image.network(
          '${EndPoint.urlImmage}${data.weather![0].icon}@${data.weather![0].id! > 200 ? '2x.png' : '5x.png'}'),
      title: Text(
        DateFormat.yMMMEd().add_jms().format(DateTime.parse(data.dtTxt!)),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            data.weather?[0].main ?? '',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Temp : ${(data.main!.temp! - 273.15).floorToDouble()} °C',
            style: const TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}
