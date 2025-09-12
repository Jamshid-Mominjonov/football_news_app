import '../../../domain/entities/favourites_entity.dart';

abstract class HiveLocalDataSource {
  Future<void> addToFavourites({required Favourites favourites});
  Future <List<Favourites>> getFavourites();
  Future<void> deleteFavourites(int index);
}