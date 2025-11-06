import 'package:bookshelf/features/author/domain/entities/links_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links_model.g.dart';

@JsonSerializable()
class LinksModel extends LinksEntity {
  const LinksModel({super.author, super.next, super.self});

  factory LinksModel.fromJson(Map<String, dynamic> json) => _$LinksModelFromJson(json);
}
