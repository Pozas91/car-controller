import 'package:flutter/material.dart';

import 'my_colors.dart';

final myTheme = ThemeData(
  fontFamily: 'OpenSans',
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: MyColors.primaryText,
      backgroundColor: MyColors.primaryColorLight,
      textStyle: const TextStyle(color: MyColors.primaryText),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: MyColors.primaryColorDark
  )
);
