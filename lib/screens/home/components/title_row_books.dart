import 'package:bookers/constants.dart';
import 'package:flutter/material.dart';

class TitleRowBooks extends StatelessWidget {
  final String title;
  const TitleRowBooks({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: myTextColor, fontSize: 17),
      ),
    );
  }
}
