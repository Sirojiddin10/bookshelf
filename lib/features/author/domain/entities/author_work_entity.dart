import 'package:equatable/equatable.dart';

class AuthorWorkEntity extends Equatable {
  final String key;
  final String title;

  const AuthorWorkEntity({this.key = '', this.title = ''});

  @override
  List<Object?> get props => [key, title];
}
