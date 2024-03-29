import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picreqapplication/core/services/api_service.dart';
import 'package:picreqapplication/features/home/data/home_repos/home_repo.dart';
import 'package:picreqapplication/features/home/data/models/picture_cat_model.dart';
import 'package:picreqapplication/features/home/presentaion/view_model/manager/dowload_image_cubit/download_states.dart';

class DownloadCubit extends Cubit<DownloadStates> {
  DownloadCubit(
    this._homeRepo,
  ) : super(DownloadingInitalState());
  final HomeRepo _homeRepo;
  String? currentType;
  List<PicCat> images = [];

  void fetchImages(String type) async {
    currentType = type;

    try {
      emit(DownloadingLoadingState());

      images = await ApiServices(Dio()).get(query: type);
      // images = await _homeRepo.fetchImages(endpoint: type)  ;
      emit(
        DownloadingSucessfullState(
          images: images,
        ),
      );
    } on Exception catch (e) {
      emit(
        DownloadingFailureState(
          errorMessage: e.toString(),
        ),
      );

      // showSnakBar(context, e.toString());
    }
  }

  List<PicCat> getImages() {
    return images;
  }

//   Future<List<PicCat>> getPciture({String type = 'general '}) async {
//     // if (type == '') {
//     //   type = 'general';
//     // }
//     String url = "$baseUrl?key=$kPrimaryApiKey&q=$type";
//     try {
//       emit(DownloadingInitalState());

//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);

//         if (data['totalHits'] != null) {
//           for (var hint in data['hits']) {
//             // pictures.add(PicCat.fromJosn(response.headers));
//             images.add(PicCat.fromJosn(
//               image: hint['webformatURL'],
//               length: hint['imageHeight'],
//               type: hint['tags'],
//             ));
//           }
//           emit(DownloadingSucessfullState(images: images));
//           return images;
//         } else {
//           emit(DownloadingFailureState(
//               errorMessage: 'Unexpected response format from Pixabay API'));
//           // showSnakBar(context, 'Unexpected response format from Pixabay API');
//           throw Exception('Unexpected response format from Pixabay API');
//         }
//       } else {
//         emit(DownloadingFailureState(errorMessage: 'Failed to load images '));
//         // showSnakBar(context, 'Unexpected response format from Pixabay API');
//         throw Exception('failed to load image');
//       }
//     } catch (e) {
//       emit(DownloadingFailureState(errorMessage: e.toString()));
//       // showSnakBar(context, e.toString());
//       throw Exception(e.toString());
//     }
//   }
}
