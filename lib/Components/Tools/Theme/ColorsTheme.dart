import 'dart:io';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Platform.isIOS ? Colors.transparent : Colors.grey,
  focusColor: const Color.fromARGB(255, 31, 110, 185),
  primaryColor: const Color.fromARGB(255, 31, 110, 185),
  colorScheme: const ColorScheme.light(
    secondary: Color.fromARGB(255, 69, 147, 220),
    tertiary: Color.fromARGB(255, 87, 164, 237),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color.fromARGB(255, 89, 157, 230),
    selectionColor: Color.fromARGB(255, 89, 157, 230),
    selectionHandleColor: Color.fromARGB(255, 89, 157, 230),
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      color: Color.fromRGBO(13, 22, 48, 1),
    )
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
  dividerColor: const Color.fromRGBO(230, 230, 230, 1),
  shadowColor: Colors.grey
);
