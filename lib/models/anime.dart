class Anime {
  final String title;
  final String image;
  final double rating;
  final List<String> genres;
  final String description;

  Anime({
    required this.title,
    required this.image,
    required this.rating,
    required this.genres,
    required this.description,
  });

  factory Anime.fromAniList(Map<String, dynamic> json) {
    String rawDescription = json['description'] ?? '';

    // Убираем HTML теги
    rawDescription = rawDescription.replaceAll(RegExp(r'<[^>]*>'), '');

    return Anime(
      title: json['title']['romaji'] ?? '',
      image: json['coverImage']['large'] ?? '',
      rating: ((json['averageScore'] ?? 0) / 10),
      genres: List<String>.from(json['genres'] ?? []),
      description: rawDescription,
    );
  }
}
