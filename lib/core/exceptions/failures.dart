import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? errorMessage;
  final String? errorKey;

  const Failure({this.errorMessage, this.errorKey});

  @override
  List<Object?> get props => [errorMessage, errorKey];
}

class ServerFailure extends Failure {
  final num statusCode;

  const ServerFailure({required super.errorMessage, required this.statusCode, required super.errorKey});
}

class DioFailure extends Failure {
  final DioExceptionType type;
  final int? statusCode;

  const DioFailure({required super.errorMessage, this.type = DioExceptionType.badResponse, this.statusCode});
}

class ParsingFailure extends Failure {
  const ParsingFailure({required super.errorMessage});
}

class CacheFailure extends Failure {}
