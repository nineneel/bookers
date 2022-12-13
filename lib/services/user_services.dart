import 'dart:convert';
import 'dart:developer';
import 'package:bookers/models/book.dart';
import 'package:bookers/models/user.dart';
import 'package:bookers/services/globals.dart';
import 'package:http/http.dart' as http;

class BookServices {
  static Future<User> getUser() async {
    try {
      var map = Map<String, dynamic>();
      final response = await http.get(Uri.parse(baseURL + 'get/user'));
      if (200 == response.statusCode) {
        User user = User.fromJson(json.decode(response.body));
        return user;
      } else {
        return User(id: 1, email: 'fe', name: 'kjef');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Book>> getAllBooks() async {
    try {
      var map = Map<String, dynamic>();
      final response = await http.get(Uri.parse(baseURL + 'books'));
      if (200 == response.statusCode) {
        List<Book> list = parseResponse(response.body);
        return list;
      } else {
        return <Book>[];
      }
    } catch (e) {
      return <Book>[];
    }
  }

  static Future<List<Book>> getBooksByRecomended() async {
    try {
      var map = Map<String, dynamic>();
      final response = await http.get(Uri.parse(baseURL + 'by/recomended'));
      if (200 == response.statusCode) {
        List<Book> list = parseResponse(response.body);
        return list;
      } else {
        return <Book>[];
      }
    } catch (e) {
      return <Book>[];
    }
  }

  static Future<List<Book>> getBooksByPopular() async {
    try {
      var map = Map<String, dynamic>();
      final response = await http.get(Uri.parse(baseURL + 'by/popular'));
      if (200 == response.statusCode) {
        List<Book> list = parseResponse(response.body);
        return list;
      } else {
        return <Book>[];
      }
    } catch (e) {
      return <Book>[];
    }
  }

  static List<Book> parseResponse(String response) {
    final parsed = json.decode(response);
    return parsed.map<Book>((json) => Book.fromJson(json)).toList();
  }
}
