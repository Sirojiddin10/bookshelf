part of 'author_bloc.dart';

class AuthorState extends Equatable {
  final int resultCount;
  final List<AuthorEntity> authors;
  final FormStatus authorsStatus;

  const AuthorState({this.resultCount = 0, this.authors = const [], this.authorsStatus = FormStatus.pure});

  AuthorState copyWith({int? resultCount, List<AuthorEntity>? authors, FormStatus? authorsStatus}) {
    return AuthorState(
      resultCount: resultCount ?? this.resultCount,
      authors: authors ?? this.authors,
      authorsStatus: authorsStatus ?? this.authorsStatus,
    );
  }

  @override
  List<Object?> get props => [resultCount, authors, authorsStatus];
}
