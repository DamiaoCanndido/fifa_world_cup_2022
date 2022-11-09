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
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
    ),
  );

  static const textBold = TextStyle(fontWeight: FontWeight.bold);
}
