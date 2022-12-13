import 'package:bookers/constants.dart';
import 'package:bookers/models/book.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Book book;
  final void Function() press;
  final bool isFirst, isLast;

  const ItemCard({
    required this.book,
    required this.press,
    this.isLast = false,
    this.isFirst = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double leftPadd = isFirst ? 20.0 : 5.0;
    double rightPadd = isLast ? 20.0 : 5.0;
    return Container(
      margin:
          EdgeInsets.only(left: leftPadd, right: rightPadd, top: 5, bottom: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
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
                    width: size.width * 0.28,
                    height: size.width * 0.4478,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Container(
                        width: size.width * 0.28,
                        height: size.width * 0.4478,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
