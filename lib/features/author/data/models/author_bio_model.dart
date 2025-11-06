import 'package:bookshelf/features/author/domain/entities/author_bio_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_bio_model.g.dart';

@JsonSerializable()
class AuthorBioModel extends AuthorBioEntity {
  const AuthorBioModel({super.type, super.value});

  factory AuthorBioModel.fromJson(Map<String, dynamic> json) => _$AuthorBioModelFromJson(json);
}
