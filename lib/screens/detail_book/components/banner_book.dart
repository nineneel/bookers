import 'package:bookers/constants.dart';
import 'package:bookers/models/book.dart';
import 'package:bookers/models/genre.dart';
import 'package:bookers/screens/detail_book/components/gendre_tag.dart';
import 'package:flutter/material.dart';

class BannerBook extends StatelessWidget {
  const BannerBook({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 10,
                color: myPrimaryColor.withOpacity(0.20),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox.fromSize(
              child: Image.network(
                book.cover,
                width: size.width * 0.35,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            width: size.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${book.title}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${book.authors}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    for (Genre genre in book.genres)
                      GenreTag(
                        title: genre.name,
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
