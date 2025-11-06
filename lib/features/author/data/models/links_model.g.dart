// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) => LinksModel(
  author: json['author'] as String? ?? '',
  next: json['next'] as String? ?? '',
  self: json['self'] as String? ?? '',
);

Map<String, dynamic> _$LinksModelToJson(LinksModel instance) =>
    <String, dynamic>{
      'self': instance.self,
      'author': instance.author,
      'next': instance.next,
    };
