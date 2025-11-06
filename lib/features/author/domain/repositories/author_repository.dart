import 'package:bookshelf/core/exceptions/failures.dart';
import 'package:bookshelf/core/utils/either.dart';
import 'package:bookshelf/features/author/data/models/generic_pagination_model.dart';
import 'package:bookshelf/features/author/domain/entities/author_detail_entity.dart';
import 'package:bookshelf/features/author/domain/entities/author_entity.dart';
import 'package:bookshelf/features/author/domain/entities/author_work_entity.dart';

abstract class AuthorRepository {
  Future<Either<Failure, ({double resultCount, List<AuthorEntity> results})>> getAuthors(String query);

  Future<Either<Failure, AuthorDetailEntity>> getAuthorDetail(String authorId);

  Future<Either<Failure, GenericPagination<AuthorWorkEntity>>> getAuthorWorks(String authorId, [String? next]);
}
