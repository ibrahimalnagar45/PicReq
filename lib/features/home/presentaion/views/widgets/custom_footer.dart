import 'package:flutter/material.dart';
import 'package:picreqapplication/features/home/presentaion/views/favorites_view.dart';
import 'package:picreqapplication/features/home/presentaion/views/home_view.dart';
import 'package:picreqapplication/features/search/presentaion/views/search_view.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeView.id);
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, FavortiesView.id);
            },
            icon: const Icon(Icons.favorite),
            color: Colors.red,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Searchview.id);
            },
            icon: const Icon(Icons.search_outlined),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Image(
          //       image: AssetImage('assets/pictures/Modern Building Logo.jpg')),
          // )
        ],
      ),
    );
  }
}
/**const Stack(
              children: [
                Icon(
                  Icons.panorama_fisheye_outlined,
                ),
                Positioned(
                    top: 4,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 400,
                      
                      foregroundImage: AssetImage(
                          'assets/pictures/Modern Building Logo.jpg'),
                      backgroundColor: Colors.amber,
                    ))
              ],
            ), */
