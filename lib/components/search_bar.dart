import 'package:bookers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: myPadding + 5, left: myPadding, right: myPadding),
      padding: const EdgeInsets.symmetric(horizontal: myPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: myWhiteColor,
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: myTextColor,
            ),
            hintText: "Search a book",
            hintStyle: const TextStyle(color: myTextColor)),
      ),
    );
  }
}
