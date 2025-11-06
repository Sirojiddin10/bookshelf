import 'package:bookshelf/features/author/domain/entities/author_bio_entity.dart';
import 'package:bookshelf/features/author/domain/entities/author_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthorDetailModel extends AuthorDetailEntity {
  const AuthorDetailModel({super.name, super.bio, super.birthDate, super.deathDate});

  factory AuthorDetailModel.fromJson(Map<String, dynamic> json) => _$AuthorDetailModelFromJson(json);
}
