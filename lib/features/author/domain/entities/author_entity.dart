import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final String birthDate;
  final String deathDate;
  final String key;
  final String name;
  final String topWork;
  final String type;
  final int workCount;
  final double ratingsAverage;
  final int ratingsCount;
  final int wantToReadCount;
  final int alreadyReadCount;

  const AuthorEntity({
    this.birthDate = '',
    this.deathDate = '',
    this.key = '',
    this.name = '',
    this.topWork = '',
    this.type = '',
    this.workCount = 0,
    this.ratingsAverage = 0,
    this.ratingsCount = 0,
    this.wantToReadCount = 0,
    this.alreadyReadCount = 0,
  });

  String get fullDate {
    if (birthDate.isEmpty && deathDate.isEmpty) {
      return 'N/A';
    } else if (deathDate.isEmpty) {
      return 'birth. $birthDate';
    } else if (birthDate.isEmpty) {
      return 'death. $deathDate';
    } else {
      return '$birthDate - $deathDate';
    }
  }

  @override
  @override
  List<Object?> get props => [
    birthDate,
    deathDate,
    key,
    name,
    topWork,
    type,
    workCount,
    ratingsAverage,
    ratingsCount,
    wantToReadCount,
    alreadyReadCount,
  ];
}
