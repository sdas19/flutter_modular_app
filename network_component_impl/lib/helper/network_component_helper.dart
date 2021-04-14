import 'package:dio/dio.dart';
import 'dart:math';

class NetworkComponentHelper {
  static var dio;

  static Dio getOrCreateDio() {
    if (dio == null) {
      var options = BaseOptions(
          baseUrl: 'https://stg.gopayapi.com',
          connectTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'content-Type': 'application/json',
            'authorization': 'Bearer ${_generateToken()}'
          });
      dio = Dio(options);
    }
    return dio;
  }

  static String _generateToken() => Random().nextDouble().toString();
}
