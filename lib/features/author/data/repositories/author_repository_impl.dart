import 'package:bookshelf/core/exceptions/failures.dart';
import 'package:bookshelf/core/services/request_handler_service.dart';
import 'package:bookshelf/core/utils/either.dart';
import 'package:bookshelf/features/author/data/datasources/author_datasource.dart';
import 'package:bookshelf/features/author/domain/entities/author_entity.dart';
import 'package:bookshelf/features/author/domain/repositories/author_repository.dart';

class AuthorRepositoryImpl implements AuthorRepository {
  final RequestHandlerService requestHandlerService;
  final AuthorDatasource datasource;

  AuthorRepositoryImpl(this.requestHandlerService, this.datasource);

  @override
  Future<Either<Failure, ({double resultCount, List<AuthorEntity> results})>> fetchAuthors(String query) {
    return requestHandlerService.handleRequestInRepository<({double resultCount, List<AuthorEntity> results})>(
      onRequest: () => datasource.fetchAuthors(query),
    );
  }

}
