import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  final List<String> categories = const [
    ' backgrounds ',
    ' fashion ',
    ' nature ',
    ' science ',
    ' education ',
    ' feelings ',
    ' health ',
    ' people ',
    ' religion ',
    ' places ',
    ' animals ',
    ' industry ',
    ' computer ',
    ' food ',
    ' sports ',
    ' transportation ',
    ' travel ',
    ' buildings ',
    ' business ',
    ' music '
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: ((context, index) => CategoryItem(
            category: categories[index],
          )),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'category_item.dart';

// class CategoryListView extends StatelessWidget {
//   const CategoryListView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: 10,
//       itemBuilder: (context, index) => Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 1.0,
//         ),
//         child: CategoryItem(),
//       ),
//     );
//   }
// }
