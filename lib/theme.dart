
import 'package:flutter/material.dart';
const kPrimarySwatch = Colors.red;
const kSeedColor = Colors.red;
const lightAppBarColor = Colors.red;
const darkAppBarColor = Color(0xff70140f);

final colorScheme = ColorScheme.fromSwatch(
  primarySwatch: kPrimarySwatch, // Die gewählte Farbschwelle
);


final lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: lightAppBarColor,
    titleTextStyle: TextStyle(
      color:Colors.white,
      fontSize: 22// Ändern Sie die Textfarbe auf Weiß
    ),
  ),
  brightness: Brightness.light,
  colorSchemeSeed: kSeedColor,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: darkAppBarColor,
    titleTextStyle: TextStyle(
        color:Colors.white,
        fontSize: 22// Ändern Sie die Textfarbe auf Weiß
    ),
  ),
  brightness: Brightness.dark,
  colorSchemeSeed: kSeedColor,
);
