import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:picreqapplication/features/home/data/home_repos/home_repo.dart';
import 'package:picreqapplication/features/home/data/home_repos/home_repo_impl.dart';
import 'package:picreqapplication/features/home/data/models/picture_cat_model.dart';
import 'package:picreqapplication/features/home/presentaion/view_model/manager/favorites_cubit/favorites_cubit.dart';
import 'constants.dart';
import 'core/cubits/theme_cubit/theme_cubit.dart';
import 'features/home/presentaion/view_model/manager/dowload_image_cubit/download_image_cubit.dart';
import 'features/auth/presentaion/views/login_view.dart';
import 'features/auth/presentaion/views/sing_up_view.dart';
import 'features/home/presentaion/views/favorites_view.dart';
import 'features/search/presentaion/views/search_view.dart';
import 'features/splash/presentaion/views/splash_view.dart';
import 'firebase_options.dart';
import 'features/home/presentaion/views/home_view.dart';
import 'core/services/api_service.dart';
import 'simple_bloc_obsever.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(PicCatAdapter());
  await Hive.openBox<PicCat>(favoritesKey);
  // Hive.close();
  
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider(
          create: (context) => DownloadCubit(
            HomeRepoImpl(apiServices: ApiServices(Dio())),
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: BlocProvider.of<ThemeCubit>(context).theme,
          routes: {
            SplashView.id: (context) => const SplashView(),
            LoginView.id: (context) => const LoginView(),
            SignUpView.id: (context) => const SignUpView(),
            HomeView.id: (context) => const HomeView(),
            FavortiesView.id: (context) => const FavortiesView(),
            Searchview.id: (context) => const Searchview(),
          },
          initialRoute: SplashView.id,
        ),
      ),
    );
  }
}
