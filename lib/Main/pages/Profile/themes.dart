import 'package:flutter/material.dart';

class MyThemes {
  static final primary = Colors.redAccent;
  static final primaryColor = Colors.red.shade300;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    accentColor: Colors.purpleAccent,
    colorScheme: ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
  );
}
