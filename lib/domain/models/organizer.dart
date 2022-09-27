class Organizer {
  final String name;
  final List<String> genres;
  final String image;

  Organizer({
    required this.name,
    required this.genres,
    required this.image,
  });

  Organizer.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        genres =
            (json['genres'] as List<dynamic>).map((e) => e.toString()).toList(),
        image = json['image'];
}
