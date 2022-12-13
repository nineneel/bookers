import 'dart:developer';

import 'package:bookers/models/author.dart';
import 'package:bookers/models/genre.dart';
import 'package:bookers/models/location.dart';

class Book {
  // final String title, description, cover, authors;
  // final int id, year;
  final String title, description, cover, authors, year;
  final int id;
  final List<Genre> genres;
  final Location location;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.year,
    required this.authors,
    required this.cover,
    required this.genres,
    required this.location,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final authorsData = json['authors'] as List<dynamic>?;
    final authors = authorsData != null
        ? authorsData
            .map((data) => Author.fromJson(data))
            .toList()
            .map((data) => data.name.toString())
            .join(', ')
        : "-";
    final genresData = json['genres'] as List<dynamic>?;
    final genres = genresData != null
        ? genresData.map((data) => Genre.fromJson(data)).toList()
        : <Genre>[];
    final location = Location(
        id: json['location']['id'],
        block: json['location']['block'],
        lane: json['location']['lane'],
        row: json['location']['row']);
    return Book(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      year: json['year'],
      cover: json['cover'],
      authors: authors,
      genres: genres,
      location: location,
    );
  }
}
