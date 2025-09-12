import '../entities/favourites_entity.dart';
import '../repositories/news_repository.dart';

class GetFavouritesUseCase {
  NewsRepository newsRepository;

  GetFavouritesUseCase({required this.newsRepository});

  Future <List<Favourites>> call() {
    return newsRepository.getFavourites();
  }
}