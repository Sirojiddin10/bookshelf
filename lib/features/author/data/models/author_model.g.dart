// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => AuthorModel(
  birthDate: json['birth_date'] as String? ?? '',
  deathDate: json['death_date'] as String? ?? '',
  key: json['key'] as String? ?? '',
  name: json['name'] as String? ?? '',
  topWork: json['top_work'] as String? ?? '',
  type: json['type'] as String? ?? '',
  workCount: (json['work_count'] as num?)?.toInt() ?? 0,
  ratingsAverage: (json['ratings_average'] as num?)?.toDouble() ?? 0,
  ratingsCount: (json['ratings_count'] as num?)?.toInt() ?? 0,
  wantToReadCount: (json['want_to_read_count'] as num?)?.toInt() ?? 0,
  alreadyReadCount: (json['already_read_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      'birth_date': instance.birthDate,
      'death_date': instance.deathDate,
      'key': instance.key,
      'name': instance.name,
      'top_work': instance.topWork,
      'type': instance.type,
      'work_count': instance.workCount,
      'ratings_average': instance.ratingsAverage,
      'ratings_count': instance.ratingsCount,
      'want_to_read_count': instance.wantToReadCount,
      'already_read_count': instance.alreadyReadCount,
    };
