import '../../../models/home/favourites_entity.dart';
import '../../../models/home/news_model.dart';
import '../../home/local/hive_local_data_source.dart';
import '../../home/remote/news_remote_data_source.dart';

class NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final HiveLocalDataSource hiveLocalDataSource;

  NewsRepository({
    required this.newsRemoteDataSource,
    required this.hiveLocalDataSource,
  });

  Future<List<NewsModel>> getNews() {
    return newsRemoteDataSource.getNews();
  }

  Future<void> addToFavourites(Favourites favourites) {
    return hiveLocalDataSource.addToFavourites(favourites: favourites);
  }

  Future<List<Favourites>> getFavourites() {
    return hiveLocalDataSource.getFavourites();
  }

  Future<void> deleteFavourites(int index) {
    return hiveLocalDataSource.deleteFavourites(index);
  }
}