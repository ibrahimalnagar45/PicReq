import 'package:picreqapplication/features/home/data/models/image_model/image_model.dart';

abstract class HomeRepo {
  Future<List<dynamic>> fetchImages({required String endpoint});
  
  Future<List<dynamic>> fetchRelevanceImages({required String query});
}