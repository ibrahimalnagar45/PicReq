import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  ThemeData theme = ThemeData.light();
  changeTheme() {
    if (theme == ThemeData.light()) {
      theme = ThemeData.dark();
      emit(ThemeDark());
    } else {
      theme = ThemeData.light();
      emit(ThemeLight());
    }
  }
}
