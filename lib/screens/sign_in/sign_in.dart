import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bookers/components/input_field.dart';
import 'package:bookers/constants.dart';
import 'package:bookers/models/user.dart';
import 'package:bookers/screens/menu/menu.dart';
import 'package:bookers/screens/register/register.dart';
import 'package:bookers/services/auth_services.dart';
import 'package:bookers/services/globals.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  String password = "";

  signInPress() async {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (emailValid) {
      http.Response response = await AuthServices.login(email, password);

      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        User user = User.fromJson(responseMap.values.first);
        Navigator.push(
          this.context,
          MaterialPageRoute(
            builder: (BuildContext context) => Menu(
              user: user,
            ),
          ),
        );
      } else {
        errorSnackBar(this.context, responseMap.values.first);
      }
    } else {
      errorSnackBar(this.context, "email not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: myBodyColor,
          title: Text(
            "Sign In",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputField(
                  title: "Email",
                  onChange: (value) {
                    email = value;
                  },
                ),
                InputField(
                  title: "Password",
                  onChange: (value) {
                    password = value;
                  },
                  isPassword: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Sign In".toUpperCase(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: myPrimaryColor,
                      foregroundColor: myWhiteColor,
                      minimumSize: Size(100, 50)),
                  onPressed: () => signInPress(),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Register(),
                      ),
                    );
                  },
                  child: const Text(
                    "don't have account yet",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
