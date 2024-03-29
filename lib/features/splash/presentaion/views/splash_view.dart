import 'package:picreqapplication/features/splash/presentaion/views/widgets/splash_view_body.dart';

import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplahViewBody());
  }
}
