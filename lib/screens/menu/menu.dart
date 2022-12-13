import 'dart:io';

import 'package:bookers/constants.dart';
import 'package:bookers/models/user.dart';
import 'package:bookers/screens/catalog/catalog.dart';
import 'package:bookers/screens/home/home_screen.dart';
import 'package:bookers/screens/profile/profile.dart';
import 'package:bookers/screens/your_book/your_book.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final User user;

  const Menu({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState(user: this.user);
}

class _MenuState extends State<Menu> {
  int _selectedItem = 0;

  late List<Widget> screens;

  final User user;
  _MenuState({required this.user});

  @override
  void initState() {
    super.initState();

    screens = [
      HomeScreen(user: user),
      const Catalog(),
      const YourBook(),
      Profile(user: user)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          height: 75,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: myWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildIconNavBar(
                icon: Icons.home_filled,
                press: () {
                  setState(() {
                    _selectedItem = 0;
                  });
                },
                selected: _selectedItem == 0,
              ),
              buildIconNavBar(
                icon: Icons.library_books,
                press: () {
                  setState(() {
                    _selectedItem = 1;
                  });
                },
                selected: _selectedItem == 1,
              ),
              buildIconNavBar(
                icon: Icons.bookmarks,
                press: () {
                  setState(() {
                    _selectedItem = 2;
                  });
                },
                selected: _selectedItem == 2,
              ),
              buildIconNavBar(
                icon: Icons.account_circle_rounded,
                press: () {
                  setState(() {
                    _selectedItem = 3;
                  });
                },
                selected: _selectedItem == 3,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: screens[_selectedItem],
        ),
      ),
    );
  }
}

IconButton buildIconNavBar(
    {required icon, required Function() press, required selected}) {
  return IconButton(
    onPressed: press,
    icon: Icon(
      icon,
      color: selected ? myPrimaryColor : myIconColor,
    ),
  );
}
