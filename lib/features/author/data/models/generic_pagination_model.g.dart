// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericPagination<T> _$GenericPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => GenericPagination<T>(
  links: json['links'] == null
      ? const LinksModel()
      : LinksModel.fromJson(json['links'] as Map<String, dynamic>),
  entries:
      (json['entries'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
);

Map<String, dynamic> _$GenericPaginationToJson<T>(
  GenericPagination<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'links': instance.links,
  'entries': instance.entries.map(toJsonT).toList(),
};
