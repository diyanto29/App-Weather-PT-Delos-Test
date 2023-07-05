//mengimport library atau file yang diperlukan dalam kode
import 'package:flutter/material.dart';
import 'package:flutter_weather_delos/app/constant/app.dart';
import 'package:flutter_weather_delos/core/models/wheater_data/wheater_data.dart';
import 'package:intl/intl.dart';
import '../../constant/endpoint.dart';

//definisi class statelesswidget. untuk membuat detail view
class DetailWeatherDataView extends StatelessWidget {
  final WheaterData data;
  const DetailWeatherDataView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppConstant.titleWeatherDetail),
      ), //membuat tampilan diatas dan teks nya diatur tidak berada ditengah
      body: Padding(
        padding: const EdgeInsets.all(8.0), //mengatur jarak widget column
        child: Column(
          //widget column
          crossAxisAlignment:
              CrossAxisAlignment.center, //mengatur child secara horizontal
          mainAxisSize: MainAxisSize.max, //mengatur kolom untuk mengisi ruang
          children: [
            Center(
              child: Text(
                DateFormat.yMMMMEEEEd().format(DateTime.parse(data.dtTxt!)),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ), //mengatur teks ditengah dan value tanggal
            const SizedBox(
              height: 4,
            ), //mengatur jarak antar column atau tata letak tampilan
            Center(
              child: Text(
                DateFormat().add_jm().format(DateTime.parse(data.dtTxt!)),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ), //mengatur teks ditengah dan value waltu
            const SizedBox(
              height: 20,
            ), //mengatur jarak antar column atau tata letak tampilan
            Row(
              //mengatur child dan children secara horizontal
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, //mengatur jarak yang rata
              crossAxisAlignment: CrossAxisAlignment
                  .center, //mengatur child dengan jarak yang sama ditengah
              children: [
                Flexible(
                    flex: 2,
                    child: Text(
                      '${(data.main!.temp! - 273.15).floorToDouble()} °C',
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )), //tampilan teks suhu
                Flexible(
                  flex: 1,
                  child: Image.network(
                      '${EndPoint.urlImmage}${data.weather![0].icon}@4x.png'),
                ) //tampilan gambar diambil secara online menggunakan url
              ],
            ),
            const SizedBox(
              height: 20,
            ), //mengatur jarak antar column atau tata letak tampilan
            Center(
              child: Text(
                '${data.weather![0].main}( ${data.weather![0].description} )',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ), //mengatur jarak antar column atau tata letak tampilan
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, //mengatur jarak yang rata
              crossAxisAlignment: CrossAxisAlignment
                  .center, //mengatur child dengan jarak yang sama ditengah
              children: [
                Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //mengatur child tampil ditengah
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //mengatur child dengan jarak yang sama ditengah
                      children: [
                        const Text(
                          'Temp (min)',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ), //menampilkan teks temperatur minimal
                        const SizedBox(
                          height: 5,
                        ), //mengatur jarak antar column atau tata letak tampilan
                        Text(
                          '${(data.main!.tempMin! - 273.15).floorToDouble()} °C',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ), //menampilkan teks dan konversi bilangan bulat
                      ],
                    )),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //mengatur child tampil ditengah
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //mengatur child dengan jarak yang sama ditengah
                    children: [
                      const Text(
                        'Temp (max)',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ), //menampilkan teks temperatur maksimal
                      const SizedBox(
                        height: 5,
                      ), //mengatur jarak antar column atau tata letak tampilan
                      Text(
                        '${(data.main!.tempMax! - 273.15).floorToDouble()} °C',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ), //menampilkan teks dan konversi bilangan bulat temperatur
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
