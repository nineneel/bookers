import 'package:bookers/constants.dart';
import 'package:flutter/material.dart';

class GenreTag extends StatelessWidget {
  final String title;
  const GenreTag({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5, bottom: 5),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: myWhiteColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
