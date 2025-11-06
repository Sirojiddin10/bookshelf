import 'package:bookshelf/features/author/data/models/links_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generic_pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericPagination<T> {
  final LinksModel links;
  final List<T> entries;

  GenericPagination({this.links = const LinksModel(), this.entries = const []});

  factory GenericPagination.fromJson(Map<String, dynamic> json, T Function(Object?) fetch) =>
      _$GenericPaginationFromJson(json, fetch);
}
