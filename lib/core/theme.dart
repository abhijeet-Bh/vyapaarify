import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  //color pallet
  static const Color primaryColor = Color(0xff457AE5);
  static const Color primaryBackgroundColor = Color(0xffF0EEFF);
  static const Color accentColor = Color(0xff44CA58);
  static const Color black = Color(0xff222222);
  static const Color whiteColor = Color(0xffFFFFFF);

  static const Color blueLightColor = Color(0xffE7E5FF);

  // App Theme Constants
  static const EdgeInsetsGeometry pagePadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 12,
  );

  //Text Style
  //Headings
  static const TextStyle primaryHeadingTextLarge = TextStyle(
    fontSize: 26,
    color: primaryColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  );
  static const TextStyle primaryHeadingTextMedium = TextStyle(
    fontSize: 18,
    color: primaryColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  );
  static const TextStyle primaryHeadingTextSmall = TextStyle(
    fontSize: 16,
    color: primaryColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  );

  //Body
  static const TextStyle primaryBodyTextLarge = TextStyle(
    fontSize: 16,
    color: black,
    fontFamily: 'Poppins',
  );
  static const TextStyle primaryBodyTextMedium = TextStyle(
    fontSize: 14,
    color: black,
    fontFamily: 'Poppins',
  );
  static const TextStyle primaryBodyTextSmall = TextStyle(
    fontSize: 12,
    color: black,
    fontFamily: 'Poppins',
  );

  //Text Theme
  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: primaryHeadingTextMedium,
    bodyLarge: primaryBodyTextMedium,
  );

  //Themes
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      color: whiteColor,
      iconTheme: IconThemeData(color: primaryColor),
    ),
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      onPrimary: primaryBackgroundColor,
      secondary: accentColor,
    ),
    textTheme: _lightTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: primaryColor),
  );
}
