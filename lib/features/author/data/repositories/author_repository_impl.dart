import 'package:bookshelf/core/exceptions/failures.dart';
import 'package:bookshelf/core/services/request_handler_service.dart';
import 'package:bookshelf/core/utils/either.dart';
import 'package:bookshelf/features/author/data/datasources/author_datasource.dart';
import 'package:bookshelf/features/author/data/models/generic_pagination_model.dart';
import 'package:bookshelf/features/author/domain/entities/author_detail_entity.dart';
import 'package:bookshelf/features/author/domain/entities/author_entity.dart';
import 'package:bookshelf/features/author/domain/entities/author_work_entity.dart';
import 'package:bookshelf/features/author/domain/repositories/author_repository.dart';

class AuthorRepositoryImpl implements AuthorRepository {
  final RequestHandlerService requestHandlerService;
  final AuthorDatasource datasource;

  AuthorRepositoryImpl(this.requestHandlerService, this.datasource);

  @override
  Future<Either<Failure, ({double resultCount, List<AuthorEntity> results})>> getAuthors(String query) {
    return requestHandlerService.handleRequestInRepository<({double resultCount, List<AuthorEntity> results})>(
      onRequest: () => datasource.getAuthors(query),
    );
  }

  @override
  Future<Either<Failure, AuthorDetailEntity>> getAuthorDetail(String authorId) {
    return requestHandlerService.handleRequestInRepository<AuthorDetailEntity>(
      onRequest: () => datasource.getAuthorDetail(authorId),
    );
  }

  @override
  Future<Either<Failure, GenericPagination<AuthorWorkEntity>>> getAuthorWorks(String authorId, [String? next]) {
    return requestHandlerService.handleRequestInRepository<GenericPagination<AuthorWorkEntity>>(
      onRequest: () => datasource.getAuthorWorks(authorId, next),
    );
  }
}
