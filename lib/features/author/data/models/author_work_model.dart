import 'package:bookshelf/features/author/domain/entities/author_work_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_work_model.g.dart';

@JsonSerializable()
class AuthorWorkModel extends AuthorWorkEntity {
  const AuthorWorkModel({super.key, super.title});

  factory AuthorWorkModel.fromJson(Map<String, dynamic> json) => _$AuthorWorkModelFromJson(json);
}
