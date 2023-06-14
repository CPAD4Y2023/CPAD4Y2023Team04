class News {
  final String link;
  final String text;
  final String type;

  const News({
    required this.link,
    required this.text,
    required this.type,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      link: json['link'],
      text: json['text'],
      type: json['type'],
    );
  }
}