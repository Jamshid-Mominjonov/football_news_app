import 'package:hive/hive.dart';

part 'favourites_entity.g.dart';

@HiveType(typeId: 0)
class Favourites extends HiveObject {
  @HiveField(0)
  String image;
  @HiveField(1)
  String title;
  @HiveField(2)
  String originalUrl;

  Favourites({
    required this.image,
    required this.title,
    required this.originalUrl,
  });
}

