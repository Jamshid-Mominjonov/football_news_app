import 'package:football_news_app/features/home/domain/entities/news_entity.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<NewsEntity> newsEntity;

  NewsSuccess(this.newsEntity);
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}