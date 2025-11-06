part of 'author_bloc.dart';

@immutable
sealed class AuthorEvent {}

class GetAuthorsEvent extends AuthorEvent {
  final String query;

  GetAuthorsEvent({required this.query});
}