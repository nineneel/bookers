class Location {
  final int id;
  final String block, lane, row;

  Location({
    required this.id,
    required this.block,
    required this.lane,
    required this.row,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      block: json['block'],
      lane: json['lane'],
      row: json['row'],
    );
  }
}
