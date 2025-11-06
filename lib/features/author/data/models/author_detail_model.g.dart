// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorDetailModel _$AuthorDetailModelFromJson(Map<String, dynamic> json) =>
    AuthorDetailModel(
      name: json['name'] as String? ?? '',
      bio: json['bio'] == null
          ? const AuthorBioEntity()
          : const AuthorBioConverter().fromJson(
              json['bio'] as Map<String, dynamic>,
            ),
      birthDate: json['birth_date'] as String? ?? '',
      deathDate: json['death_date'] as String? ?? '',
    );

Map<String, dynamic> _$AuthorDetailModelToJson(AuthorDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bio': const AuthorBioConverter().toJson(instance.bio),
      'birth_date': instance.birthDate,
      'death_date': instance.deathDate,
    };
