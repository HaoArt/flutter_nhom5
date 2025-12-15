class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String author;
  final String sourceName;
  final DateTime publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.author,
    required this.sourceName,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ?? "",
      content: json["content"] ?? "",
      author: json["author"] ?? "Unknown",
      sourceName: json["source"]?["name"] ?? "Unknown",
      publishedAt:
          DateTime.tryParse(json["publishedAt"] ?? "") ?? DateTime.now(),
    );
  }
}
