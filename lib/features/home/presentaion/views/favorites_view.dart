import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picreqapplication/core/utils/app_bar_actions.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/custom_footer.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/empty_favorite_body.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/favorites_view_body.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/image_cards_builder.dart';
import '../../../../constants.dart';
import '../../data/models/picture_cat_model.dart';
import '../view_model/manager/favorites_cubit/favorites_cubit.dart';
import 'widgets/image_card.dart';

class FavortiesView extends StatefulWidget {
  static String id = 'Favorite View';
  const FavortiesView({
    super.key,
  });

  @override
  State<FavortiesView> createState() => _FavortiesViewState();
}

class _FavortiesViewState extends State<FavortiesView> {
  // List<PicCat> favorites = [];

  @override
  // void initState() {
  //   favorites = BlocProvider.of<FavoritePicCubit>(context).getFav();
  //   setState(() {});
  //   super.initState();
  // }

  // bool enable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(kPrimaryAppName),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          AppBarActions(),
        ],
      ),
      persistentFooterButtons: const [CustomFooter()],

      // body: const EmptyFavoriteBody(),
      body: BlocProvider.of<FavoritesCubit>(context).getFavorite().isEmpty
          ? const EmptyFavoriteBody()
          : BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesDone) {
                  return FavortiesviewBody(
                    images:
                        BlocProvider.of<FavoritesCubit>(context).getFavorite(),
                  );
                } else {
                  return const EmptyFavoriteBody();
                }
              },
            ),
    );
  }
}
