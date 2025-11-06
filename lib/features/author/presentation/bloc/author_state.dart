part of 'author_bloc.dart';

class AuthorState extends Equatable {
  final int resultCount;
  final List<AuthorEntity> authors;
  final FormStatus authorsStatus;
  final List<AuthorWorkEntity> authorWorks;
  final FormStatus authorWorkStatus;
  final String authorWorksNextLink;
  final AuthorDetailEntity authorDetail;
  final FormStatus authorDetailStatus;

  const AuthorState({
    this.resultCount = 0,
    this.authors = const [],
    this.authorsStatus = FormStatus.pure,
    this.authorDetail = const AuthorDetailEntity(),
    this.authorDetailStatus = FormStatus.pure,
    this.authorWorks = const [],
    this.authorWorksNextLink = '',
    this.authorWorkStatus = FormStatus.pure,
  });

  AuthorState copyWith({
    int? resultCount,
    List<AuthorEntity>? authors,
    FormStatus? authorsStatus,
    List<AuthorWorkEntity>? authorWorks,
    FormStatus? authorWorkStatus,
    String? authorWorksNextLink,
    AuthorDetailEntity? authorDetail,
    FormStatus? authorDetailStatus,
  }) {
    return AuthorState(
      resultCount: resultCount ?? this.resultCount,
      authors: authors ?? this.authors,
      authorsStatus: authorsStatus ?? this.authorsStatus,
      authorDetail: authorDetail ?? this.authorDetail,
      authorDetailStatus: authorDetailStatus ?? this.authorDetailStatus,
      authorWorks: authorWorks ?? this.authorWorks,
      authorWorksNextLink: authorWorksNextLink ?? this.authorWorksNextLink,
      authorWorkStatus: authorWorkStatus ?? this.authorWorkStatus,
    );
  }

  @override
  List<Object?> get props => [
    resultCount,
    authors,
    authorsStatus,
    authorDetail,
    authorDetailStatus,
    authorWorks,
    authorWorksNextLink,
    authorWorkStatus,
  ];
}
