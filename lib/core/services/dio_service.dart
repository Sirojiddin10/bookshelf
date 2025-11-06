import 'dart:developer';

import 'package:bookshelf/assets/app_constants.dart';
import 'package:dio/dio.dart';

class DioService {
  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    validateStatus: (status) => status != null && status >= 200 && status < 300,
  );

  Dio get dio {
    final Dio dioClient = Dio(_baseOptions);
    dioClient.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, logPrint: (e) => log(e.toString())),
    );
    return dioClient;
  }
}
