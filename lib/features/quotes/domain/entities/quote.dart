class Quote {
  final String id;
  final String text;
  final String author;
  final bool isFavorite;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    this.isFavorite = false,
  });
}