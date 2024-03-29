import 'package:picreqapplication/features/home/presentaion/view_model/manager/dowload_image_cubit/download_image_cubit.dart';
import 'package:picreqapplication/core/utils/app_bar_actions.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/custom_footer.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/error_body.dart';
import 'package:picreqapplication/features/home/presentaion/views/widgets/home_view_body.dart';
import '../view_model/manager/dowload_image_cubit/download_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/category_listview.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.type = 'portaits'});

  static String id = 'generalPage';
  final String type;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    if (BlocProvider.of<DownloadCubit>(context).getImages().isEmpty ||
        BlocProvider.of<DownloadCubit>(context).currentType != widget.type) {
      BlocProvider.of<DownloadCubit>(context).fetchImages(widget.type);
    } else {}
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.transparent),
        centerTitle: true,
        title: const Text(kPrimaryAppName),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          AppBarActions(),
        ],
      ),
      persistentFooterButtons: const [
        CustomFooter(),
      ],
      body:
          BlocBuilder<DownloadCubit, DownloadStates>(builder: (context, state) {
        if (state is DownloadingFailureState) {
          return ErrorBody(
            errorMessage: state.errorMessage,
          );
        } else if (state is DownloadingSucessfullState) {
          return GeneralBody(
            images: state.images,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
