class Genre {
  final int id;
  final String name, description;

  Genre({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
