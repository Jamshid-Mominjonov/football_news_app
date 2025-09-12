import 'package:football_news_app/features/home/domain/entities/news_entity.dart';
import 'package:football_news_app/features/home/domain/repositories/news_repository.dart';

class NewsUseCase {
  NewsRepository newsRepository;

  NewsUseCase({required this.newsRepository});

  Future<List<NewsEntity>> call() {
    return newsRepository.getNews();
  }
}