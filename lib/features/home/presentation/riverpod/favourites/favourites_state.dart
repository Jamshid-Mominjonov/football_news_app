import 'package:football_news_app/features/home/domain/entities/favourites_entity.dart';

abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}

class FavouritesLoading extends FavouritesState {}

class FavouritesSuccess extends FavouritesState {
  final List<Favourites> favourites;

  FavouritesSuccess(this.favourites);
}

class FavouritesError extends FavouritesState {
  final String message;

  FavouritesError(this.message);
}