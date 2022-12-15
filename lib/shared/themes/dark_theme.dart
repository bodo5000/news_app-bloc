import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/constants/colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: ColorsUsed.darkColor,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorsUsed.darkColor,
      statusBarIconBrightness: Brightness.light,
    ),
    titleSpacing: 20.0,
    backgroundColor: ColorsUsed.darkColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: ColorsUsed.orangeColor,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: ColorsUsed.orangeColor,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: false,
    selectedItemColor: ColorsUsed.whiteColor,
    backgroundColor: Colors.deepOrange,
  ),
  primarySwatch: Colors.deepOrange,
);
