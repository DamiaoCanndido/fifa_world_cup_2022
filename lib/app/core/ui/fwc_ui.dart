import 'package:flutter/material.dart';

class FWCUI {
  FWCUI._();

  static final ThemeData theme = ThemeData(
    primaryColor: const Color(0xFFA40734),
    scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 36),
    primaryColorDark: const Color(0xFF090910),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF181820),
    ),
    textTheme: const TextTheme(
        titleSmall: TextStyle(
      color: Colors.white,
    )),
    fontFamily: "Roboto",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF7DD43),
        textStyle: const TextStyle(
          fontFamily: 'Roboto',
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF181820),
      selectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(color: Colors.grey),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.black,
      unselectedIconTheme: IconThemeData(color: Colors.black),
    ),
  );

  static const textBold = TextStyle(fontWeight: FontWeight.bold);
}
