import 'package:flutter/material.dart';
import 'package:picreqapplication/features/home/presentaion/views/home_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomeView(
                  type: category,
                );
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey.withOpacity(.2)),
          child: Center(
              child: Text(
            category,
            // style: const TextStyle(color: Colors.black),
          )),
        ),
      ),
    );
  }
}
