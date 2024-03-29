import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picreqapplication/features/home/data/models/image_model/image_model.dart';
import '../../../data/models/picture_cat_model.dart';
import 'image_card.dart';

class ImagesBuilder extends StatelessWidget {
  const ImagesBuilder({
    super.key,
    required this.images,
    required this.status,
  });

  final List<PicCat> images;
  final String status;
  @override
  Widget build(BuildContext context) {
    return images.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : Expanded(
            child: MasonryGridView.count(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ImageCard(
                  status: status,
                  image: images[index],
                );
              },
            ),
          );
  }
}
