import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/home/news_repository.dart';
import '../../../models/home/favourites_entity.dart';
import 'news_state.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  final NewsRepository newsRepository;

  NewsNotifier({required this.newsRepository}) : super(NewsInitial());

  Future<void> getNews() async {
    state = NewsLoading();
    try {
      final news = await newsRepository.getNews();
      state = NewsSuccess(news);
    } catch (e) {
      state = NewsError(e.toString());
    }
  }

  Future<void> addToFav(Favourites favourites) async {
    try {
      await newsRepository.addToFavourites(favourites);
    } catch (e) {
      state = NewsError(e.toString());
    }
  }
}