import 'package:equatable/equatable.dart';

class LinksEntity extends Equatable {
  final String self;
  final String author;
  final String next;

  const LinksEntity({this.self = '', this.author = '', this.next = ''});

  @override
  List<Object?> get props => [self, author, next];
}
