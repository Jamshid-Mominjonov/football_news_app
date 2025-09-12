class NewsEntity {
  final int? id;
  final String? title;
  final String? image;
  final String? alias;
  final String? originalUrl;
  final String? lang;
  final DateTime publishedAt;
  final List<int>? leagues;
  final List<int>? teams;
  final List<int>? countries;

  const NewsEntity({
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
}