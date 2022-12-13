import 'package:bookers/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final Function(String) onChange;
  final bool isPassword;

  const InputField({
    Key? key,
    required this.title,
    required this.onChange,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title".toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: myPadding / 2),
          padding: const EdgeInsets.symmetric(horizontal: myPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: myWhiteColor,
          ),
          child: TextField(
            obscureText: isPassword,
            enableSuggestions: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Input your ${title.toLowerCase()}",
              hintStyle: const TextStyle(color: myTextColor),
            ),
            onChanged: onChange,
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
