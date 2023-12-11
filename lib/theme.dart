import 'package:flutter/material.dart';

const kLightThemeColor = Color(0xff140f38);
const scaffoldBackgroundColor = Color(0xffe0e0e0);


final kLightTheme = ThemeData(
  useMaterial3: true,
  //scaffoldBackgroundColor: scaffoldBackgroundColor,
  brightness: Brightness.light,
  colorSchemeSeed: kLightThemeColor,
  dropdownMenuTheme:const DropdownMenuThemeData(),
  appBarTheme: const AppBarTheme(
    //backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  /*buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
          12.0),
    ),
)*/
);

final kDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorSchemeSeed: kLightThemeColor,
);
