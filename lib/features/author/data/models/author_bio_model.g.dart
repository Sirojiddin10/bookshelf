// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_bio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorBioModel _$AuthorBioModelFromJson(Map<String, dynamic> json) =>
    AuthorBioModel(
      type: json['type'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$AuthorBioModelToJson(AuthorBioModel instance) =>
    <String, dynamic>{'type': instance.type, 'value': instance.value};
