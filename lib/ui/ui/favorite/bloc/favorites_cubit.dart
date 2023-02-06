import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/models/favorites/favorites_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState());

  void updateData({Favorites? favorites}) {
    emit(state.copyWith(favorites: favorites));
  }

  Future<void> addToFav({required String favoriteId}) async {
    final box = Hive.box<Favorites>('favorites');
    List<String> list = box.values.first.favoriteHurdles ?? [];
    if (list.contains(favoriteId) == false) {
      list.add(favoriteId);
      await box.clear();
      await box.put('favorites', Favorites(favoriteHurdles: list));
      emit(state.copyWith(
          favorites: Hive.box<Favorites>('favorites').values.first));
    }
  }

  Future<void> removeFromFav({required String favoriteId}) async {
    final box = Hive.box<Favorites>('favorites');
    List<String> list = box.values.first.favoriteHurdles ?? [];
    if (list.contains(favoriteId) == true) {
      list.remove(favoriteId);
      await box.clear();
      await box.put('favorites', Favorites(favoriteHurdles: list));
      emit(state.copyWith(
          favorites: Hive.box<Favorites>('favorites').values.first));
    }
  }
}
