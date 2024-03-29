import 'package:flutter/material.dart';

import 'features/auth/presentaion/views/login_view.dart';
import 'features/auth/presentaion/views/sing_up_view.dart';
import 'features/home/presentaion/views/favorites_view.dart';
import 'features/home/presentaion/views/home_view.dart';
import 'features/search/presentaion/views/search_view.dart';
import 'features/splash/presentaion/views/splash_view.dart';

const String kPrimaryAppName = 'PicREQ';
const Color kPrimaryColor = Color(0xffed2625);
const double kPrimaryPadding = 24;
const double kPimaryFontSize = 18;
const String kPrimaryLogo = 'assets/pictures/sakani logo.jpg';
const String kPrimaryApiKey = '41812890-3c569273f61913bd507adc40d';
// const kPrimaryApiKey =
//     'osOs3y2trVmD6iG8Mhld1svwVdoofy1puYS6bvqMGCED1hPZBtTx61bh';
// const String kPrimaryApiUrl = 'https://api.pexels.com/v1/search';

const String baseUrl = "https://pixabay.com/api/";

const favoritesKey = 'favorites';

Map<String, Widget Function(BuildContext)> routes = {
  SplashView.id: (context) => const SplashView(),
  LoginView.id: (context) => const LoginView(),
  SignUpView.id: (context) => const SignUpView(),
  HomeView.id: (context) => const HomeView(),
  FavortiesView.id: (context) => const FavortiesView(),
  Searchview.id: (context) => const Searchview(),
};
