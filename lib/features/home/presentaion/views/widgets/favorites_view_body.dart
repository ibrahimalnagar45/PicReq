import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picreqapplication/features/home/data/models/picture_cat_model.dart';

import 'image_card.dart';

class FavortiesviewBody extends StatelessWidget {
  const FavortiesviewBody({super.key, required this.images});
  final List<PicCat> images;
  @override
  Widget build(BuildContext context) {
    // return Text("data");
    return images.isEmpty
        ? const Text('no data')
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: MasonryGridView.count(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ImageCard(
                  status: 'del',
                  image: images[index],
                );
              },
            ),
          );
  }
}
