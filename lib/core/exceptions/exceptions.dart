import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String errorMessage;
  final String errorKey;
  final num statusCode;

  const ServerException({
    required this.statusCode,
    required this.errorMessage,
    required this.errorKey,
  });

  @override
  String toString() {
    return 'ServerException(statusCode: $statusCode, errorMessage: $errorMessage, errorKey: $errorKey)';
  }
}

class CustomDioException implements Exception {
  final String errorMessage;
  final DioExceptionType type;
  final int? statusCode;

  CustomDioException({required this.errorMessage, required this.type, this.statusCode});
}

class ParsingException implements Exception {
  final String errorMessage;

  const ParsingException({required this.errorMessage});
}
