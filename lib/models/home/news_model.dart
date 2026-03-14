List<NewsModel> newsFromJson(List<dynamic> str) =>
    List<NewsModel>.from(str.map((x) => NewsModel.fromJson(x)));

class NewsModel {
  final int id;
  final String title;
  final String image;
  final String alias;
  final String originalUrl;
  final String lang;
  final DateTime publishedAt;
  final List<int> leagues;
  final List<int> teams;
  final List<int> countries;

  const NewsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.alias,
    required this.originalUrl,
    required this.lang,
    required this.publishedAt,
    required this.leagues,
    required this.teams,
    required this.countries,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      alias: json['alias'] ?? '',
      originalUrl: json['original_url'] ?? '',
      lang: json['lang'] ?? '',
      publishedAt: DateTime.tryParse(json['published_at'] ?? '') ?? DateTime.now(),
      leagues: (json['leagues'] as List?)?.map((e) => e as int).toList() ?? [],
      teams: (json['teams'] as List?)?.map((e) => e as int).toList() ?? [],
      countries: (json['countries'] as List?)?.map((e) => e as int).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'alias': alias,
      'original_url': originalUrl,
      'lang': lang,
      'published_at': publishedAt.toIso8601String(),
      'leagues': leagues,
      'teams': teams,
      'countries': countries,
    };
  }
}