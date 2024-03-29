import 'package:picreqapplication/core/services/api_service.dart';
import 'package:picreqapplication/features/home/data/home_repos/home_repo.dart';
import 'package:picreqapplication/features/home/data/models/image_model/image_model.dart';
import 'package:picreqapplication/features/home/data/models/picture_cat_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices _apiServices;

  HomeRepoImpl({required ApiServices apiServices}) : _apiServices = apiServices;

  @override
  Future<List<PicCat>> fetchImages({required String endpoint}) async {
    var images = await _apiServices.get(query: endpoint);
    return images;
  }

  @override
  Future<List<PicCat>> fetchRelevanceImages({required String query}) async {
    var images = await _apiServices.get(query: query);
    return images;
  }
}
