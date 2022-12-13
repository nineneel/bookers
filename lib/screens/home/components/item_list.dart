import 'package:bookers/models/book.dart';
import 'package:bookers/components/item_card.dart';
import 'package:bookers/screens/detail_book/detail_book.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final List<Book> books;
  const ItemList({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pos = 1;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (Book book in books)
            ItemCard(
              book: book,
              isFirst: pos == 1 ? true : false,
              isLast: pos++ == books.length ? true : false,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailBook(
                    book: book,
                  );
                }));
              },
            )
        ],
      ),
    );
  }
}
