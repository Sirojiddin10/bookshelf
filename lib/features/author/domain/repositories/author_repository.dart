import 'package:bookshelf/core/exceptions/failures.dart';
import 'package:bookshelf/core/utils/either.dart';
import 'package:bookshelf/features/author/domain/entities/author_entity.dart';

abstract class AuthorRepository {
  Future<Either<Failure, ({double resultCount, List<AuthorEntity> results})>> fetchAuthors(String query);
}
