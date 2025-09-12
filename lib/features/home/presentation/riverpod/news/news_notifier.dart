import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/home/domain/use_cases/news_use_case.dart';
import 'package:football_news_app/features/home/presentation/riverpod/news/news_state.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  NewsUseCase newsUseCase;

  NewsNotifier({required this.newsUseCase}) : super(NewsInitial());

  Future<void> getNews() async {
    state = NewsLoading();
    try {
      final news = await newsUseCase.call();
      state = NewsSuccess(news);
    } catch (e) {
      state = NewsError(e.toString());
    }
  }
}