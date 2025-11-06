import 'package:bookshelf/core/exceptions/failures.dart';
import 'package:bookshelf/core/usecase/usecase.dart';
import 'package:bookshelf/core/utils/either.dart';
import 'package:bookshelf/features/author/domain/entities/author_detail_entity.dart';
import 'package:bookshelf/features/author/domain/repositories/author_repository.dart';

class GetAuthorDetailUseCase implements UseCase<AuthorDetailEntity, String> {
  final AuthorRepository repository;

  GetAuthorDetailUseCase(this.repository);

  @override
  Future<Either<Failure, AuthorDetailEntity>> call(String params) async {
    return await repository.getAuthorDetail(params);
  }
}
