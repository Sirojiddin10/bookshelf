import 'package:bookshelf/assets/enums.dart';
import 'package:bookshelf/features/author/presentation/bloc/author_bloc.dart';
import 'package:bookshelf/features/author/presentation/widgets/sliver_paginator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsSingleScreen extends StatefulWidget {
  final String authorId;
  final String authorName;

  const AuthorsSingleScreen({super.key, required this.authorId, required this.authorName});

  @override
  State<AuthorsSingleScreen> createState() => _AuthorsSingleScreenState();
}

class _AuthorsSingleScreenState extends State<AuthorsSingleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthorBloc>().add(GetAuthorDetailsEvent(authorId: widget.authorId));
    context.read<AuthorBloc>().add(GetAuthorWorksEvent(authorId: widget.authorId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.authorName)),
      body: BlocBuilder<AuthorBloc, AuthorState>(
        builder: (context, state) {
          if (state.authorDetailStatus.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.authorDetailStatus.isSuccess) {
            final author = state.authorDetail;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bio', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Text(author.bio.value, style: TextStyle(fontSize: 16)),
                        Text('Works', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 24),
                  sliver: SliverPaginator(
                    paginatorStatus: state.authorWorkStatus,
                    itemBuilder: (context, index) {
                      final authorWork = state.authorWorks[index];
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(authorWork.title),
                      );
                    },
                    itemCount: state.authorWorks.length,
                    fetchMoreFunction: () {
                      context.read<AuthorBloc>().add(
                        GetAuthorWorksEvent(authorId: widget.authorId, nextLink: state.authorWorksNextLink),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    hasMoreToFetch: state.authorWorksNextLink.isNotEmpty,
                    errorWidget: Text('Something went wrong'),
                    emptyWidget: Text('No works found'),
                  ),
                ),
              ],
            );
          } else if (state.authorDetailStatus.isError) {
            return Center(child: Text('Something went wrong'));
          }
          return Center(child: Text('Author details will be displayed here.'));
        },
      ),
    );
  }
}
