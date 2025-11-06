import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final String error;
  final String key;

  ErrorModel({this.error = '', this.key = ''});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
}
