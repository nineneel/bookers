import 'package:bookers/components/item_card.dart';
import 'package:bookers/components/search_bar.dart';
import 'package:bookers/constants.dart';
import 'package:bookers/models/book.dart';
import 'package:bookers/screens/detail_book/detail_book.dart';
import 'package:bookers/services/book_services.dart';
import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  late List<Book> _all_books;

  @override
  void initState() {
    super.initState();
    _all_books = [];
    _getbooks();
  }

  _getbooks() {
    BookServices.getAllBooks().then((res) {
      setState(() {
        _all_books = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myBodyColor,
          foregroundColor: myTextColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 70,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                "All Book",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: _all_books.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) => ItemCard(
              book: _all_books[index],
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailBook(
                    book: _all_books[index],
                  );
                }));
              },
            ),
          ),
        ));
  }
}
