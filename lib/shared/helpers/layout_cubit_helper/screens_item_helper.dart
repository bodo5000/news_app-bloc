import 'package:flutter/material.dart';

import 'package:news_app/views/screens/business_screen.dart';
import 'package:news_app/views/screens/general_screen.dart';
import 'package:news_app/views/screens/sciences_screen.dart';
import 'package:news_app/views/screens/sports_screen.dart';

class DeclearScreensItems {
  static List<Widget> screensShow = [
    const BusinessScreen(),
    const SportsScreen(),
    const SciencesScreen(),
    const GeneralScreen(),
  ];
}
