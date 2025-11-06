import 'package:bookshelf/features/author/domain/entities/author_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthorModel extends AuthorEntity {
  const AuthorModel({
    super.birthDate,
    super.deathDate,
    super.key,
    super.name,
    super.topWork,
    super.type,
    super.workCount,
    super.ratingsAverage,
    super.ratingsCount,
    super.wantToReadCount,
    super.alreadyReadCount,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => _$AuthorModelFromJson(json);
}
