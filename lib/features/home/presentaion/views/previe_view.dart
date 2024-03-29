import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picreqapplication/core/widgets/custom_appbar_actions.dart';
import 'package:picreqapplication/features/home/data/models/image_model/image_model.dart';
import 'package:picreqapplication/features/home/data/models/picture_cat_model.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/custom_footer.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/preview_view_body.dart';
import '../../../../core/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';

class PreviewView extends StatelessWidget {
  const PreviewView({
    super.key,
    required this.image,
    required this.images,
  });
  static String id = 'Previeview';
  final PicCat image;
  final List<PicCat> images;

  @override
  Widget build(BuildContext context) {
    // final List<String> type = widget.image.type.split(',');
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.transparent),
          centerTitle: true,
          title: const Text(kPrimaryAppName),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: const [
            CustomActions(),
          ],
        ),
        persistentFooterButtons: const [
          CustomFooter(),
        ],
        body: PreviewViewBody(
          image: image,
          images: images,
        ));
  }
}
