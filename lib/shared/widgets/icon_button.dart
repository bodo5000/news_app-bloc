import 'package:flutter/material.dart';

Widget reusableIconButton(
    {required IconData icon, required VoidCallback onPressed}) {
  return IconButton(
    onPressed: onPressed,
    icon: Icon(icon),
  );
}
