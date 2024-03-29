import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picreqapplication/features/home/presentaion/view_model/manager/dowload_image_cubit/download_image_cubit.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/custom_footer.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/image_cards_builder.dart';
import 'package:picreqapplication/features/search/presentaion/views/widgets/search_feild.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});
  static const String id = 'Search View';
  @override
  Widget build(BuildContext context) {
    // final images = BlocProvider.of<DownloadCubit>(context).getImages();

    return Scaffold(
      appBar: AppBar(),
      persistentFooterButtons: const [CustomFooter()],
      body:const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.0),
        child: CustomScrollView(
          slivers: [
              SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Searchfeild(),
              ),
            ),
            // SliverFillRemaining(
            //   child: images.isEmpty
            //       ? const Center(
            //           child: CircularProgressIndicator(
            //           color: Colors.red,
            //         ))
            //       : ImagesBuilder(
            //           status: 'add',
            //           images: [],
            //         ),
            // ),
          ],
        ),
      ),
    );
  }
}
