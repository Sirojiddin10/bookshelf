import 'package:bookshelf/assets/enums.dart';
import 'package:bookshelf/features/author/presentation/bloc/author_bloc.dart';
import 'package:bookshelf/features/author/presentation/widgets/author_card.dart';
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
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        elevation: 0,
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
      body: BlocBuilder<AuthorBloc, AuthorState>(
        builder: (context, state) {
          if (state.authorsStatus.isPure) {
            return Center(child: Text('Please enter a search term to find authors.'));
          } else if (state.authorsStatus.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.authorsStatus.isSuccess) {
            if (state.authors.isEmpty) {
              return Center(child: Text('No authors found.'));
            }
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemCount: state.authors.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final author = state.authors[index];
                return AuthorCard(author: author);
              },
            );
          } else if (state.authorsStatus.isError) {
            return Center(child: Text('Failed to load authors. Please try again.'));
          }
          return ListView();
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
