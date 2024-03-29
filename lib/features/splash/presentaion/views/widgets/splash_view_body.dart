import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picreqapplication/features/auth/presentaion/views/login_view.dart';
import 'package:picreqapplication/features/home/presentaion/views/home_view.dart';

import '../../../../../constants.dart';

class SplahViewBody extends StatefulWidget {
  const SplahViewBody({super.key});

  @override
  State<SplahViewBody> createState() => _SplahViewBodyState();
}

class _SplahViewBodyState extends State<SplahViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;
  @override
  void initState() {
    super.initState();

    initAnimation();
    goTologin();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kPrimaryPadding * 1.5),
            child: Image.asset(
              kPrimaryLogo,
              height: 200,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AnimatedBuilder(
          animation: _slidingAnimation,
          builder: (context, _) => SlideTransition(
            position: _slidingAnimation,
            child: const Text(
              'Rich your eyes',
              style: TextStyle(fontSize: 30, fontFamily: 'Satisfy'),
            ),
          ),
        ),
      ],
    );
  }

  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _slidingAnimation =
        Tween(begin: const Offset(0, 20), end: const Offset(0, 1))
            .animate(_animationController);
    _animationController.forward();
  }

  void goTologin() {
    Future.delayed(const Duration(seconds: 3),
        () => Navigator.popAndPushNamed(context, HomeView.id));
  }
}
