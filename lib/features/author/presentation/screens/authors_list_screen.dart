import 'package:bookshelf/features/author/presentation/bloc/author_bloc.dart';
import 'package:bookshelf/features/author/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsListScreen extends StatefulWidget {
  const AuthorsListScreen({super.key});

  @override
  State<AuthorsListScreen> createState() => _AuthorsListScreenState();
}

class _AuthorsListScreenState extends State<AuthorsListScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authors'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchField(
              controller: _searchController,
              onClearTap: () {
                _searchController.clear();
              },
              onChanged: (query) {
                context.read<AuthorBloc>().add(GetAuthorsEvent(query: query));
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
