import 'package:bookshelf/features/author/domain/entities/author_entity.dart';
import 'package:bookshelf/features/author/presentation/screens/authors_single_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({super.key, required this.author});

  final AuthorEntity author;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => AuthorsSingleScreen(authorId: author.key, authorName: author.name),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5, offset: Offset(0, 3)),
          ],
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${author.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Birth and death dates: ${author.fullDate}', style: TextStyle(fontSize: 16)),
            Text('Top work: ${author.topWork} ', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
