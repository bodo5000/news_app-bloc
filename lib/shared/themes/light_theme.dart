import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/constants/colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: ColorsUsed.whiteColor,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorsUsed.whiteColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleSpacing: 20.0,
    backgroundColor: ColorsUsed.whiteColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: ColorsUsed.orangeColor,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: ColorsUsed.orangeColor,
      size: 30.0,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: false,
    selectedItemColor: ColorsUsed.orangeColor,
  ),
  primarySwatch: Colors.deepOrange,
);
