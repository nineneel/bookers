import 'package:bookers/models/book.dart';
import 'package:bookers/screens/detail_book/components/detail_item.dart';
import 'package:flutter/material.dart';

class ItemDetailList extends StatelessWidget {
  const ItemDetailList({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailItem(
            title: "Title",
            content: book.title,
          ),
          DetailItem(
            title: "Authors",
            content: book.authors,
          ),
          DetailItem(
            title: "Year",
            content: book.year.toString(),
          ),
          DetailItem(
            title: "Description",
            content: book.description,
          ),
        ],
      ),
    );
  }
}
