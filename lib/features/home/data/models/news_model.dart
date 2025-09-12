import '../../domain/entities/news_entity.dart';

List<NewsModel> newsFromJson(List<dynamic> str) =>
    List<NewsModel>.from(str.map((x) => NewsModel.fromJson(x)));

class NewsModel extends NewsEntity {
  const NewsModel({
    required int id,
    required String title,
    required String image,
    required String alias,
    required String originalUrl,
    required String lang,
    required DateTime publishedAt,
    required List<int> leagues,
    required List<int> teams,
    required List<int> countries,
  }) : super(
    id: id,
    title: title,
    image: image,
    alias: alias,
    originalUrl: originalUrl,
    lang: lang,
    publishedAt: publishedAt,
    leagues: leagues,
    teams: teams,
    countries: countries,
  );

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