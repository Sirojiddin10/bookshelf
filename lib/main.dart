import 'package:bookshelf/core/di/service_locator.dart';
import 'package:bookshelf/features/author/domain/repositories/author_repository.dart';
import 'package:bookshelf/features/author/domain/usecases/fetch_authors_usecase.dart';
import 'package:bookshelf/features/author/domain/usecases/get_author_detail_usecase.dart';
import 'package:bookshelf/features/author/domain/usecases/get_author_works_use_case.dart';
import 'package:bookshelf/features/author/presentation/bloc/author_bloc.dart';
import 'package:bookshelf/features/author/presentation/screens/authors_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorBloc(
        fetchAuthorsUseCase: GetAuthorsUseCase(serviceLocator<AuthorRepository>()),
        getAuthorDetailUseCase: GetAuthorDetailUseCase(serviceLocator<AuthorRepository>()),
        getAuthorWorksUseCase: GetAuthorWorksUseCase(serviceLocator<AuthorRepository>()),
      ),
      child: MaterialApp(title: 'Bookshelf', home: const AuthorsListScreen()),
    );
  }
}
