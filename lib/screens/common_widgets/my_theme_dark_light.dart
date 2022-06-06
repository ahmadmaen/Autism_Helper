// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTheme {
static final darkTheme = ThemeData(
scaffoldBackgroundColor: Colors.grey.shade900,
  colorScheme: ColorScheme.dark(),
);
static final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(backgroundColor: Colors.white70,),
  colorScheme: ColorScheme.light(),

);

}