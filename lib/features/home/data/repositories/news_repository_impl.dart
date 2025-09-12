import 'package:football_news_app/features/home/data/data_sources/local/hive_local_data_source_impl.dart';
import 'package:football_news_app/features/home/data/data_sources/remote/news_remote_data_source.dart';
import 'package:football_news_app/features/home/domain/entities/news_entity.dart';
import 'package:football_news_app/features/home/domain/repositories/news_repository.dart';

import '../../domain/entities/favourites_entity.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource;
  HiveLocalDataSource hiveLocalDataSource;

  NewsRepositoryImpl(this.newsRemoteDataSource, this.hiveLocalDataSource);

  @override
  Future<List<NewsEntity>> getNews() {
    return newsRemoteDataSource.getNews();
  }

  @override
  Future<void> addToFavourites(Favourites favourites) {
    return hiveLocalDataSource.addToFavourites(favourites: favourites);
  }

  @override
  Future<List<Favourites>> getFavourites() {
    return hiveLocalDataSource.getFavourites();
  }

  @override
  Future<void> deleteFavourites(int index) {
    return hiveLocalDataSource.deleteFavourites(index);
  }
}