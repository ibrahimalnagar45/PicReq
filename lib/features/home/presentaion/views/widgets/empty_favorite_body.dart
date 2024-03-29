import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class EmptyFavoriteBody extends StatelessWidget {
  const EmptyFavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Searchfeild(),
        const SizedBox(
          height: 100,
        ),
        Center(
          child: Image.asset(
            "assets/pictures/R.png",
            scale: 10,
          ),
        ),
        const SizedBox(
          height: kPrimaryPadding,
        ),
        const Center(
          child: Text(
            "no favories images yet ",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ],
    );
  }
}
