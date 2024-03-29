import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:picreqapplication/constants.dart';
import 'package:picreqapplication/features/home/data/models/picture_cat_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  List<PicCat> _favoriteImages = [];
  final favorites = Hive.box<PicCat>(favoritesKey);

  addImage(PicCat image) {
    if (!favorites.containsKey(
        image.image.substring(image.image.length - 5, image.image.length))) {
      print("the images are   ${_favoriteImages.length}");
      favorites.put(
          image.image.substring(image.image.length - 5, image.image.length),
          image);
      _favoriteImages = favorites.values.toList();

      emit(FavoritesDone(images: _favoriteImages));
    } else {
      return;
    }
  }

  delImage(PicCat image) {
    if (favorites.containsKey(
        image.image.substring(image.image.length - 5, image.image.length))) {
      favorites.delete(
          image.image.substring(image.image.length - 5, image.image.length));
      _favoriteImages = favorites.values.toList();
      emit(FavoritesDone(images: _favoriteImages));
    } else {
      return;
    }
  }

  List<PicCat> getFavorite() {
    return favorites.values.toList();
  }
}
