import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/models/wheater_data/wheater_data.dart';
import '../../core/network/dio_service.dart';

import '../../core/models/response_message.dart';

class WeatherRemoteData extends DioService {
  Future<Either<ResponseMessage, List<WheaterData>?>> getWheaterInfo(
      {required double latitude, required double longitude}) async {
    try {
      final res = await dio.get('/forecast', queryParameters: {
        "lat": latitude,
        "lon": longitude,
      });
      if (res.statusCode == 200) {
        return Right((res.data['list'] as List<dynamic>?)
            ?.map((e) => WheaterData.fromJson(e as Map<String, dynamic>))
            .toList());
      } else {
        return Left(ResponseMessage(
            message: res.data['message'],
            status: false,
            statusCode: res.statusCode!));
      }
    } on DioError catch (e) {
      return Left(
          ResponseMessage(message: e.message, status: false, statusCode: 400));
    }
  }
}
