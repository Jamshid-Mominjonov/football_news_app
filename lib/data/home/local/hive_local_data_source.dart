import 'package:hive/hive.dart';
import '../../../models/home/favourites_entity.dart';


class HiveLocalDataSource {
  Box<Favourites> get box => Hive.box<Favourites>("FavouritesBox");

  Future<void> addToFavourites({required Favourites favourites}) async {
    await box.add(favourites);
  }

  Future<List<Favourites>> getFavourites() async {
    return box.values.toList();
  }

  Future<void> deleteFavourites(int index) async {
    await box.deleteAt(index);
  }
}