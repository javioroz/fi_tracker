import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    //colorScheme: ColorScheme.dark(),
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[700],
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green[700])),
    ),
  );
  static final lightTheme = ThemeData(
    //colorScheme: ColorScheme.light(),
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
  );
}
