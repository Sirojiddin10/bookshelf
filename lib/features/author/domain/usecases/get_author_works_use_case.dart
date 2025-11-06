import 'package:bookshelf/core/exceptions/failures.dart';
import 'package:bookshelf/core/usecase/usecase.dart';
import 'package:bookshelf/core/utils/either.dart';
import 'package:bookshelf/features/author/data/models/generic_pagination_model.dart';
import 'package:bookshelf/features/author/domain/entities/author_work_entity.dart';
import 'package:bookshelf/features/author/domain/repositories/author_repository.dart';
import 'package:equatable/equatable.dart';

class GetAuthorWorksUseCase implements UseCase<GenericPagination<AuthorWorkEntity>, GetAuthorWorksParams> {
  final AuthorRepository repository;

  GetAuthorWorksUseCase(this.repository);

  @override
  Future<Either<Failure, GenericPagination<AuthorWorkEntity>>> call(GetAuthorWorksParams params) async {
    return await repository.getAuthorWorks(params.authorId, params.next);
  }
}

class GetAuthorWorksParams extends Equatable {
  final String authorId;
  final String? next;

  const GetAuthorWorksParams({required this.authorId, this.next});

  @override
  List<Object?> get props => [authorId, next];
}
