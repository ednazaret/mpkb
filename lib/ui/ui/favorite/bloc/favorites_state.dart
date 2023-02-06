part of 'favorites_cubit.dart';

class FavoritesState {
  FavoritesState({this.favorites});

  Favorites? favorites = Hive.box<Favorites>('favorites').values.first;

  FavoritesState copyWith({Favorites? favorites}) {
    return FavoritesState(favorites: favorites ?? this.favorites);
  }
}
