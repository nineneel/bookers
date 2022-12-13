import 'package:bookers/models/book.dart';
import 'package:bookers/screens/home/components/item_list.dart';
import 'package:bookers/screens/home/components/title_row_books.dart';
import 'package:flutter/material.dart';

class RowBooks extends StatelessWidget {
  final String title;
  final List<Book> books;
  const RowBooks({
    Key? key,
    required this.title,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleRowBooks(title: title),
          ItemList(books: books),
        ],
      ),
    );
  }
}
