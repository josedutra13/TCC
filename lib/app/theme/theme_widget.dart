import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
  primaryColor: Colors.red,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(color: Colors.cyan[300]),
  backgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: MainColors.primaryColor,
      secondary: const Color.fromRGBO(71, 161, 56, 1),
      onSurface: MainColors.primaryColor),
);
