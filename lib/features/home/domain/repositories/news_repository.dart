import 'package:football_news_app/features/home/domain/entities/favourites_entity.dart';
import 'package:football_news_app/features/home/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getNews();
  Future<void> addToFavourites(Favourites favourites);
  Future <List<Favourites>> getFavourites();
  Future<void> deleteFavourites(int index);
}