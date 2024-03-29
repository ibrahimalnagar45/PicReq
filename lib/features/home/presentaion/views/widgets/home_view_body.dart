import 'package:flutter/material.dart';
import 'package:picreqapplication/features/home/data/models/image_model/image_model.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/category_listview.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/image_cards_builder.dart';
import '../../../data/models/picture_cat_model.dart';

class GeneralBody extends StatelessWidget {
  const GeneralBody({
    super.key,
    required this.images,
  });
  final List<PicCat> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView(
        children: [
          // const Searchfeild(),
          // BlocBuilder<SearchCubit, SearchState>(
          //   builder: (context, state) {
          //     if (state is SearchEnabled) {
          //       return Searchfeild(
          //         enabled: state.enabled,
          //       );
          //     } else {
          //       return const Searchfeild(
          //         enabled: false,
          //       );
          //     }
          //   },
          // ),
          const SizedBox(
            height: 6,
          ),
          const SizedBox(
            height: 30,
            child: CategoryListView(),
          ),
          const SizedBox(
            height: 10,
          ),
          ImagesBuilder(status: 'add', images: images),
        ],
      ),
    );
  }
}
