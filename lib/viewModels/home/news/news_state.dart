import '../../../models/home/news_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<NewsModel> newsEntity;

  NewsSuccess(this.newsEntity);
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}