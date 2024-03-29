import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../data/models/picture_cat_model.dart';
import '../../view_model/manager/dowload_image_cubit/download_image_cubit.dart';
import 'image_cards_builder.dart';

class PreviewViewBody extends StatefulWidget {
  const PreviewViewBody({
    super.key,
    required this.image,
    required this.images,
  });
  final List<PicCat> images;
  final PicCat image;

  @override
  State<PreviewViewBody> createState() => _PreviewViewBodyState();
}

class _PreviewViewBodyState extends State<PreviewViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DownloadCubit>(context).fetchImages(widget.image.type[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView(
        children: [
          SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kPrimaryPadding),
                    child: Image.network(
                      widget.image.image,
                    ),
                  ),
                ),
                Positioned(
                    child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.download,
                    color: Colors.black,
                  ),
                  color: Colors.white,
                ))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "more similar photos",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ImagesBuilder(
              status: 'add',
              images: BlocProvider.of<DownloadCubit>(context).getImages(),
            ),
          ),
        ],
      ),
    );
  }
}
