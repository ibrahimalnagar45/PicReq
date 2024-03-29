import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/theme_cubit/theme_cubit.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is ThemeDark) {
            return IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context).changeTheme();
                },
                icon: const Icon(
                  Icons.dark_mode,
                  color: Colors.white,
                ));
          } else {
            return IconButton(
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context).changeTheme();
              },
              icon: const Icon(Icons.light_mode),
              color: Colors.black,
            );
          }
        },
      ),
    );
  }
}
