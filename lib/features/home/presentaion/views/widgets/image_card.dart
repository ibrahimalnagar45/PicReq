import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:picreqapplication/features/home/data/models/picture_cat_model.dart';
import 'package:picreqapplication/features/home/presentaion/view_model/manager/dowload_image_cubit/download_image_cubit.dart';
import 'package:picreqapplication/features/home/presentaion/view_model/manager/favorites_cubit/favorites_cubit.dart';
import '../../../../../constants.dart';
import '../previe_view.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.image,
    this.status = 'add',
  });
  final String
      status; // this define if the image is going to be added to favorite list or deleted
  final PicCat image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<DownloadCubit>(context).fetchImages(image.type);

        BlocProvider.of<DownloadCubit>(context).getImages();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PreviewView(
                images: BlocProvider.of<DownloadCubit>(context).getImages(),
                image: image,
              );
            },
          ),
        );
      },
      child: Expanded(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kPrimaryPadding / 2),
              child: Image.network(
                  image.image // height: image.length.toDouble() * 10,
                  ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  status == 'add'
                      ? BlocProvider.of<FavoritesCubit>(context)
                          .addImage(image)
                      : BlocProvider.of<FavoritesCubit>(context)
                          .delImage(image);
                },
                icon: status == 'add'
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.heart_broken),
                color: Colors.red.withOpacity(.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
