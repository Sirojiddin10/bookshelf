import 'package:bookshelf/features/author/domain/entities/author_bio_entity.dart';
import 'package:equatable/equatable.dart';

class AuthorDetailEntity extends Equatable {
  final String name;
  @AuthorBioConverter()
  final AuthorBioEntity bio;
  final String birthDate;
  final String deathDate;

  const AuthorDetailEntity({
    this.name = '',
    this.bio = const AuthorBioEntity(),
    this.birthDate = '',
    this.deathDate = '',
  });

  @override
  List<Object?> get props => [name, bio, birthDate, deathDate];
}
