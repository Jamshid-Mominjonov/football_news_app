import 'package:football_news_app/features/home/data/data_sources/local/hive_local_data_source_impl.dart';
import 'package:football_news_app/features/home/domain/entities/favourites_entity.dart';
import 'package:hive/hive.dart';

class HiveLocalDataSourceImpl implements HiveLocalDataSource {
  late Box<Favourites> box;

  HiveLocalDataSourceImpl() {
    box = Hive.box<Favourites>("FavouritesBox");
  }

  @override
  Future<void> addToFavourites({required Favourites favourites}) async {
    await box.add(favourites);
  }

  @override
  Future<List<Favourites>> getFavourites() async {
    return box.values.toList();
  }

  @override
  Future<void> deleteFavourites(int index) async {
    await box.deleteAt(index);
  }
}