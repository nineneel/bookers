import 'package:bookers/constants.dart';
import 'package:bookers/screens/book_location/book_location.dart';
import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  const BookButton({
    required this.press,
    Key? key,
  }) : super(key: key);

  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 20,
      right: 20,
      child: ElevatedButton(
        onPressed: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            "Go to Book Location",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: myWhiteColor),
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: myPrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 10)),
      ),
    );
  }
}
