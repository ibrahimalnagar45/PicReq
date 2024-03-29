import 'package:picreqapplication/features/home/data/models/image_model/image_model.dart';

import '../../features/home/data/models/picture_cat_model.dart';

class Store {
  static List<ImageModel> favorites = [];
  void storeFav(ImageModel image) {
    if (favorites.contains(image)) {
      return;
    } else {
      favorites.add(image);
    }
  }

  void delFav(ImageModel image) {
    favorites.remove(image);
  }

  List<ImageModel> getFav() {
    return favorites;
  }
}
