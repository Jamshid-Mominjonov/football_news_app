import '../entities/favourites_entity.dart';
import '../repositories/news_repository.dart';

class AddToFavouritesUseCase{
  NewsRepository newsRepository;

  AddToFavouritesUseCase({required this.newsRepository});

  Future<void> call(Favourites favourites) {
    return newsRepository.addToFavourites(favourites);
  }
}