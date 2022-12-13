import 'package:flutter/material.dart';

// const String baseURL = "http://192.168.43.1/api/";
// const String baseURL = "http://10.0.2.2:8000/api/";
// const String baseURL = "http://127.0.0.1:8000/api/";
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
