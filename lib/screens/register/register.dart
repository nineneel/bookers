import 'dart:convert';

import 'package:bookers/components/input_field.dart';
import 'package:bookers/constants.dart';
import 'package:bookers/models/user.dart';
import 'package:bookers/screens/menu/menu.dart';
import 'package:bookers/screens/sign_in/sign_in.dart';
import 'package:bookers/services/auth_services.dart';
import 'package:bookers/services/globals.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = "";
  String email = "";
  String password = "";

  createAccountPressed() async {
    // final bool emailValid = RegExp(
    //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //     .hasMatch(email);

    // if (emailValid) {
    //   http.Response response =
    //       await AuthServices.register(name, email, password);

    //   Map responseMap = jsonDecode(response.body);
    //   if (response.statusCode == 200) {
    // User user = User.fromJson(responseMap.values.first);
    User user = new User(id: 1, email: "prasetio@email.com", name: "Prasetio");
    Navigator.push(
      this.context,
      MaterialPageRoute(
        builder: (BuildContext context) => Menu(
          user: user,
        ),
      ),
    );
    // } else {
    //   errorSnackBar(this.context, responseMap.values.first[0]);
    // }
    // } else {
    //   errorSnackBar(this.context, "email not valid");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: myBodyColor,
        title: Text(
          "Register",
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
                title: "Name",
                onChange: (value) {
                  name = value;
                },
              ),
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
                    "Create Account".toUpperCase(),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: myPrimaryColor,
                    foregroundColor: myWhiteColor,
                    minimumSize: Size(100, 50)),
                onPressed: () => createAccountPressed(),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SignIn(),
                    ),
                  );
                },
                child: const Text(
                  'already have an account',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
