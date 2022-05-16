// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/screens/Sign_in/Sign_in_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autism Helper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: kAppbarBackground),
        scaffoldBackgroundColor: kScaffoldBackground,
        iconTheme: IconThemeData(color: Colors.black, size: 30),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: SignInPage(),
    );
  }
}
