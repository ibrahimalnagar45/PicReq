import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picreqapplication/constants.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
      child: MasonryGridView.count(
        // physics: const BouncingScrollPhysics(),
        // shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: 14,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.76),
              borderRadius: BorderRadius.circular(kPrimaryPadding / 2),
            ),
          );
        },
      ),
    );
  }
}
