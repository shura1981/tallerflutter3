import 'package:flutter/material.dart';

class AppBasicTheme {
  //Theme Light
  static const Color lightPrimaryColorLight = Colors.black;
  static const Color lightPrimaryColor = Colors.purple;
  static const Color lightscaffoldBackgroundColor = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: lightPrimaryColor,
    primaryColorLight: lightPrimaryColorLight,
    appBarTheme: const AppBarTheme(color: lightPrimaryColor, elevation: 0),
    scaffoldBackgroundColor: lightscaffoldBackgroundColor,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: lightPrimaryColor)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: lightPrimaryColor, elevation: 5),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: lightPrimaryColor,
            shape: const StadiumBorder(),
            elevation: 0)),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: lightPrimaryColor),
      focusColor: Colors.white,
      filled: true,
      fillColor: Colors.grey.shade200,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: lightPrimaryColor),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
    ),
  );

//Theme dark
  static const Color darktPrimaryColorLight = Colors.grey;
  static const Color darkPrimaryColor = Colors.blue;

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: darkPrimaryColor,
      primaryColorLight: darktPrimaryColorLight,
      appBarTheme: const AppBarTheme(color: darkPrimaryColor, elevation: 0));
}
