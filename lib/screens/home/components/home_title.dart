import 'package:bookers/constants.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String username;
  HomeTitle({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: myPadding, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "Welcome back, $username !",
              style: const TextStyle(
                  color: myTextLightColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
          ),
          RichText(
            text: TextSpan(
              text: "What do you want to read today?",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w700, color: myTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
