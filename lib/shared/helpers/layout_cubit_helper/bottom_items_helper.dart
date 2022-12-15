import 'package:flutter/material.dart';

class DeclearBottomItems {
  static List<BottomNavigationBarItem> bottomBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Sciences',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.safety_check),
      label: 'General',
    ),
  ];

  static int currentIndex = 0;
}
