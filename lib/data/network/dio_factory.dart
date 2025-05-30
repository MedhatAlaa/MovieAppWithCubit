import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/app/app_constance.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = 'application/json';
const String CONTENT_TYPE = 'content-type';
const String ACCEPT = 'accept';
const String AUTHORIZATION = 'authorization';
const String LANGUAGE = 'language';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, dynamic> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: AppConstance.token,
    };
    dio.options = BaseOptions(
      baseUrl: AppConstance.baseUrl,
      receiveTimeout: const Duration(milliseconds: AppConstance.timeOut),
      sendTimeout: const Duration(milliseconds: AppConstance.timeOut),
      headers: headers,
    );

    // if (!kReleaseMode) {
    //   dio.interceptors.add(PrettyDioLogger(
    //     // requestHeader: true,
    //     // requestBody: true,
    //     // responseHeader: true,
    //   ));
    // }
    return dio;
  }
}
