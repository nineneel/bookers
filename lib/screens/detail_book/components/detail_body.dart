import 'package:bookers/models/book.dart';
import 'package:bookers/screens/book_location/book_location.dart';
import 'package:bookers/screens/detail_book/components/banner_book.dart';
import 'package:bookers/screens/detail_book/components/book_button.dart';
import 'package:bookers/screens/detail_book/components/item_list.dart';
import 'package:flutter/material.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerBook(book: book),
              ItemDetailList(book: book),
            ],
          ),
        ),
      ),
      BookButton(
        press: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BookLocation(
              book: book,
            );
          }));
        },
      )
    ]);
  }
}
