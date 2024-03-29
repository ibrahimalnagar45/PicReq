// import 'package:dio/dio.dart';

// import '../../constants.dart';

// class ApiServices {
//   final Dio _dio;

//   ApiServices({required Dio dio}) : _dio = dio;
//   get({required String query}) async {
//     //   final Map<String, String> headers = {'Authorization': kPrimaryApiKey};

//     //   try {
//     //     final Response response = await _dio.get(
//     //       kPrimaryApiUrl,
//     //       queryParameters: {'query': query},
//     //       options: Options(headers: headers),
//     //     );
//     //     // _dio.get(Uri.parse('$kPrimaryApiUrl+query=$query'), headers: headers);

//     //     return response.data;
//     //   } catch (e) {
//     //     throw (e.toString());
//     //   }
//     // }

//     List<String> urls = [];

//     Future<List<String>> getPciture({String type = 'general'}) async {
//       String url = "$kPrimaryApiKey?key=$kPrimaryApiKey&q=$type";
//       try {
//         final Response response = await _dio.get(url);
//         urls = response.data.tolist();

//         return urls;
//       } catch (e) {
//         throw (e.toString()); // TODO
//       }

//       // if (data['totalHits'] != null) {
//       //     // pictures.add(PicCat.fromJosn(response.headers));
//       //   print('the images are $urls[0]');
//       //   return urls;
//       // } else {
//       //   // showSnakBar(context, 'Unexpected response format from Pixabay API');
//       //   throw Exception('Unexpected response format from Pixabay API');
//       // }
//     }
//   }
// }

import 'package:dio/dio.dart';

import '../../constants.dart';
import '../../features/home/data/models/picture_cat_model.dart';

class ApiServices {
  List<PicCat> urls = [];

  ApiServices(
    this._dio,
  );
  final Dio _dio;
  Future<List<PicCat>> get({String query = 'general'}) async {
    String url = "$baseUrl?key=$kPrimaryApiKey&q=$query&Per_page=200";
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        // final Map<String, dynamic> data = json.decode(response.body);
        print(" the dataaaaaaaaaaavvvv is ${response.data}");

        if (response.data['totalHits'] != null) {
          for (var hint in response.data['hits']) {
            // pictures.add(PicCat.fromJosn(response.headers));
            urls.add(PicCat.fromJosn(
              image: hint['webformatURL'],
              // length: hint['imageHeight'],
              type: hint['tags'],
            ));
          }
          print("the imageeeeeeeee" + url[0]);
          return urls;
        } else {
          throw Exception('Unexpected response format from Pixabay API');
        }
      } else {
        throw Exception('failed to load image');
      }
    } catch (e) {
      print("this is the eeerroor" + e.toString());

      throw Exception(e.toString());
    }
  }
}
