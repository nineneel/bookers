import 'dart:async';

import 'package:bookers/constants.dart';
import 'package:bookers/models/user.dart';
import 'package:bookers/screens/home/home_screen.dart';
import 'package:bookers/screens/menu/menu.dart';
import 'package:bookers/screens/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookers',
      theme: ThemeData(
        primaryColor: myPrimaryColor,
        fontFamily: "Roboto",
        scaffoldBackgroundColor: myBodyColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: myTextColor),
          bodyText2: TextStyle(color: myTextColor),
        ),
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  User user = new User(id: 1, email: "prasetio@email.com", name: "Prasetio");

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      color: Colors.white,
      child: Image.asset(
        'assets/images/logo.png',
        width: size.width * 0.5,
      ),
    );
  }
}
