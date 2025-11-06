part of 'author_bloc.dart';

@immutable
sealed class AuthorEvent {}

class GetAuthorsEvent extends AuthorEvent {
  final String query;

  GetAuthorsEvent({required this.query});
}

class GetAuthorDetailsEvent extends AuthorEvent {
  final String authorId;

  GetAuthorDetailsEvent({required this.authorId});
}

class GetAuthorWorksEvent extends AuthorEvent {
  final String authorId;
  final String? nextLink;

  GetAuthorWorksEvent({required this.authorId, this.nextLink});
}
