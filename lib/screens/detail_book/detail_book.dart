import 'package:bookers/constants.dart';
import 'package:bookers/models/book.dart';
import 'package:bookers/screens/detail_book/components/detail_body.dart';
import 'package:flutter/material.dart';

class DetailBook extends StatelessWidget {
  final Book book;
  const DetailBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myBodyColor,
        foregroundColor: myTextColor,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Detail Book",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: DetailBody(book: book),
    );
  }
}
