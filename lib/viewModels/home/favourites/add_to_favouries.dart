import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/home/news_repository.dart';
import '../../../models/home/favourites_entity.dart';
import 'favourites_state.dart';

class FavouritesNotifier extends StateNotifier<FavouritesState> {
  final NewsRepository newsRepository;

  FavouritesNotifier({required this.newsRepository}) : super(FavouritesInitial());

  Future<void> getFavourites() async {
    state = FavouritesLoading();
    try {
      final favourites = await newsRepository.getFavourites();
      state = FavouritesSuccess(favourites);
    } catch (e) {
      state = FavouritesError(e.toString());
    }
  }

  Future<void> addToFavourites(Favourites favourites) async {
    state = FavouritesLoading();
    try {
      await newsRepository.addToFavourites(favourites);
      final updatedList = await newsRepository.getFavourites();
      state = FavouritesSuccess(updatedList);
    } catch (e) {
      state = FavouritesError(e.toString());
    }
  }

  Future<void> deleteFavourites(int index) async {
    state = FavouritesLoading();
    try {
      await newsRepository.deleteFavourites(index);
      final updatedList = await newsRepository.getFavourites();
      state = FavouritesSuccess(updatedList);
    } catch (e) {
      state = FavouritesError(e.toString());
    }
  }
}