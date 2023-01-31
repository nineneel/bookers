import 'package:flutter/material.dart';

const String baseURL = "https://dev.ainszatz.my.id/api/";
const Map<String, String> headers = {
  "Content-type": "application/json",
};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 4),
    ),
  );
}
