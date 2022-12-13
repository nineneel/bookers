import 'package:bookers/components/search_bar.dart';
import 'package:bookers/models/book.dart';
import 'package:bookers/models/user.dart';
import 'package:bookers/screens/home/components/home_title.dart';
import 'package:bookers/screens/home/components/row_books.dart';
import 'package:bookers/services/book_services.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final User user;

  const Body({
    super.key,
    required this.user,
  });

  @override
  State<Body> createState() => _BodyState(user: this.user);
}

class _BodyState extends State<Body> {
  late List<Book> _book_recomended, _book_popular;

  _BodyState({required User user});

  @override
  void initState() {
    super.initState();
    _book_recomended = [];
    _book_popular = [];
    _getbooks();
  }

  _getbooks() {
    BookServices.getBooksByRecomended().then((res) {
      setState(() {
        _book_recomended = res;
      });
    });

    BookServices.getBooksByPopular().then((res) {
      setState(() {
        _book_popular = res;
      });
    });
  }

  loadingBuilder(
    BuildContext context,
    Widget child,
  ) {
    Size size = MediaQuery.of(context).size;

    if (_book_recomended != []) {
      return child;
    }
    return Container(
      width: size.width * 0.28,
      height: size.width * 0.4478,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTitle(username: widget.user.name),
          SearchBox(onChanged: (value) {}),
          RowBooks(books: _book_recomended, title: "Recomended Book"),
          SizedBox(
            height: 15,
          ),
          RowBooks(books: _book_popular, title: "Popular Book"),
        ],
      ),
    );
  }
}
