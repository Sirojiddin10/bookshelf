import 'package:bookshelf/core/exceptions/failures.dart';
import 'package:bookshelf/core/usecase/usecase.dart';
import 'package:bookshelf/core/utils/either.dart';
import 'package:bookshelf/features/author/domain/entities/author_entity.dart';
import 'package:bookshelf/features/author/domain/repositories/author_repository.dart';

class GetAuthorsUseCase implements UseCase<({double resultCount, List<AuthorEntity> results}), String> {
  final AuthorRepository repository;

  GetAuthorsUseCase(this.repository);

  @override
  Future<Either<Failure, ({double resultCount, List<AuthorEntity> results})>> call(String params) async {
    return await repository.getAuthors(params);
  }
}
