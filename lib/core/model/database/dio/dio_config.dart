import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../../controller/utils/constants.dart';

class DioConfig {
  /// Aqui é onde a dependência do Dio é configurada para comunicação com as APIs externas
  static Future<Dio> builderConfig({findToken = false}) async {
    var dio = Dio(BaseOptions(
        baseUrl: POKE_API_IP,
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000));
    if (Platform.isAndroid) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    return dio;
  }
}
