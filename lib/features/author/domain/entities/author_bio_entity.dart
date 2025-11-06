import 'package:bookshelf/features/author/data/models/author_bio_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AuthorBioEntity extends Equatable {
  final String type;
  final String value;

  const AuthorBioEntity({this.type = '', this.value = ''});

  @override
  List<Object?> get props => [type, value];
}

class AuthorBioConverter implements JsonConverter<AuthorBioEntity, Map<String, dynamic>> {
  const AuthorBioConverter();
  @override
  AuthorBioEntity fromJson(Map<String, dynamic> json) {
    return AuthorBioModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AuthorBioEntity object) {
    throw {};
  }
}
