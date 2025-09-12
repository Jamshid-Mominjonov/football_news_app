import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/home/domain/use_cases/delete_from_favourites_use_case.dart';
import 'package:football_news_app/features/home/domain/use_cases/get_from_favourites_use_case.dart';
import 'package:football_news_app/features/home/presentation/riverpod/favourites/favourites_state.dart';
import '../../../domain/entities/favourites_entity.dart';
import '../../../domain/use_cases/add_to_favourites_use_case.dart';

class AddToFavouritesNotifier extends StateNotifier<FavouritesState> {
  AddToFavouritesUseCase addToFavouritesUseCase;
  GetFavouritesUseCase getFavouritesUseCase;
  DeleteFavouritesUseCase deleteFavouritesUseCase;

  AddToFavouritesNotifier(this.addToFavouritesUseCase, this.getFavouritesUseCase, this.deleteFavouritesUseCase) : super(FavouritesInitial());
  List<Favourites> getAllFavourites = [];

  Future<void> addToFavourites(Favourites favourites) async {
    state = FavouritesLoading();
    try {
      await addToFavouritesUseCase.call(favourites);
      final getAllFavourites = await getFavouritesUseCase.call();
      state = FavouritesSuccess(getAllFavourites);
    } catch (e) {
      state = FavouritesError(e.toString());
    }
  }

  void getFavourites() async {
    state = FavouritesLoading();
    try{
      final getAllFavourites = await getFavouritesUseCase.call();
      state = FavouritesSuccess(getAllFavourites);
    } catch (e) {
      state = FavouritesError(e.toString());
    }
  }

  Future<void> deleteFavourites(int index) async {
    state = FavouritesLoading();
    try {
      await deleteFavouritesUseCase.call(index);
      final getAllFavourites = await getFavouritesUseCase.call();
      state = FavouritesSuccess(getAllFavourites);
    } catch (e) {
      state = FavouritesError(e.toString());
    }
  }
}

