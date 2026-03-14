import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/viewModels/home/theme/theme.dart';
import '../../data/home/local/hive_local_data_source.dart';
import '../../data/home/remote/news_remote_data_source.dart';
import '../../data/repositories/home/news_repository.dart';
import 'favourites/add_to_favouries.dart';
import 'favourites/favourites_state.dart';
import 'news/news_notifier.dart';
import 'news/news_state.dart';

final newsRemoteDataSourceProvider = Provider<NewsRemoteDataSource>((ref) {
  return NewsRemoteDataSource();
});

final hiveLocalDataSourceProvider = Provider<HiveLocalDataSource>((ref) {
  return HiveLocalDataSource();
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepository(
    newsRemoteDataSource: ref.watch(newsRemoteDataSourceProvider),
    hiveLocalDataSource: ref.watch(hiveLocalDataSourceProvider),
  );
});

final newsNotifierProvider = StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return NewsNotifier(newsRepository: repository);
});

final addToFavouritesNotifierProvider = StateNotifierProvider<FavouritesNotifier, FavouritesState>((ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return FavouritesNotifier(newsRepository: repository);
});

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});