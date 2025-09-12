import '../repositories/news_repository.dart';

class DeleteFavouritesUseCase {
  NewsRepository newsRepository;

  DeleteFavouritesUseCase({required this.newsRepository});

  Future<void> call(int index) {
    return newsRepository.deleteFavourites(index);
  }
}