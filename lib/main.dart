import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/screen/wheater/wheater_list.dart';

import 'app/state/wheater_state/weather_state.dart';
import 'package:provider/provider.dart';

void main() async {
  initializeDateFormatting('En');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherState>(
            create: (_) => WeatherState()..getWheaterInfo())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wheather Apps',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const WheaterListView()),
    );
  }
}
