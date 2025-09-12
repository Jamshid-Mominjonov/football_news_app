import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/home/data/data_sources/local/hive_local_data_source.dart';
import 'package:football_news_app/features/home/data/data_sources/local/hive_local_data_source_impl.dart';
import 'package:football_news_app/features/home/data/data_sources/remote/news_remote_data_source.dart';
import 'package:football_news_app/features/home/data/repositories/news_repository_impl.dart';
import 'package:football_news_app/features/home/domain/repositories/news_repository.dart';
import 'package:football_news_app/features/home/domain/use_cases/news_use_case.dart';
import 'package:football_news_app/features/home/domain/use_cases/add_to_favourites_use_case.dart';
import 'package:football_news_app/features/home/presentation/riverpod/favourites/add_to_favouries.dart';
import 'package:football_news_app/features/home/presentation/riverpod/favourites/favourites_state.dart';
import 'package:football_news_app/features/home/presentation/riverpod/news/news_notifier.dart';
import 'package:football_news_app/features/home/presentation/riverpod/news/news_state.dart';
import 'package:football_news_app/features/home/presentation/riverpod/theme/theme.dart';
import '../../data/data_sources/remote/news_remote_data_source_impl.dart';
import '../../domain/use_cases/delete_from_favourites_use_case.dart';
import '../../domain/use_cases/get_from_favourites_use_case.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

// final newsRemoteDataSourceProvider = Provider<NewsRemoteDataSource>((ref) {
//   return NewsRemoteDataSourceImpl(ref.watch(dioProvider));
// });

final newsRemoteDataSourceProvider = Provider<NewsRemoteDataSource>((ref) {
  return NewsRemoteDataSourceImpl();
});


final hiveLocalDataSourceProvider = Provider<HiveLocalDataSource>((ref) {
  return HiveLocalDataSourceImpl();
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepositoryImpl(
      ref.watch(newsRemoteDataSourceProvider),
      ref.watch(hiveLocalDataSourceProvider)
  );
});

final newsUseCaseProvider = Provider<NewsUseCase>((ref) {
  return NewsUseCase(newsRepository: ref.watch(newsRepositoryProvider));
});

final newsNotifierProvider = StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  return NewsNotifier(newsUseCase: ref.watch(newsUseCaseProvider));
});

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

final addToFavouritesUseCaseProvider = Provider<AddToFavouritesUseCase>((ref) {
  return AddToFavouritesUseCase(newsRepository: ref.watch(newsRepositoryProvider));
});

final getFavouritesUseCaseProvider = Provider<GetFavouritesUseCase>((ref) {
  return GetFavouritesUseCase(newsRepository: ref.watch(newsRepositoryProvider));
});

final deleteFavouritesUseCaseProvider = Provider<DeleteFavouritesUseCase>((ref) {
  return DeleteFavouritesUseCase(newsRepository: ref.watch(newsRepositoryProvider));
});


final addToFavouritesNotifier = StateNotifierProvider<AddToFavouritesNotifier, FavouritesState>((ref) {
  return AddToFavouritesNotifier(
      ref.watch(addToFavouritesUseCaseProvider),
      ref.watch(getFavouritesUseCaseProvider),
    ref.watch(deleteFavouritesUseCaseProvider),
  );
});



