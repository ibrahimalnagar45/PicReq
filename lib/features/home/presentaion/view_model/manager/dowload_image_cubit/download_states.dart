import 'package:picreqapplication/features/home/data/models/image_model/image_model.dart';
import 'package:picreqapplication/features/home/data/models/picture_cat_model.dart';

abstract class DownloadStates {}

class DownloadingInitalState extends DownloadStates {}

class DownloadingLoadingState extends DownloadStates {}

class DownloadingSucessfullState extends DownloadStates {
  List<PicCat> images;
  DownloadingSucessfullState({required this.images});
}

class DownloadingFailureState extends DownloadStates {
  DownloadingFailureState({required this.errorMessage});
  final String errorMessage;
}

class Enabled extends DownloadStates {}

class Disabled extends DownloadStates {}
