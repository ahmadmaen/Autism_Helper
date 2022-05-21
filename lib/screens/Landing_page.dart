import 'package:autism_helper_project/screens/Sign_in/Sign_in_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  void _updateUser(User? user)
  {
    setState(() {
      _user = user;
    });
    print('User ID:${user?.uid}');
  }

  @override
  Widget build(BuildContext context) {
    if(_user == null)
    {
      return SignInPage( OnSignIn: _updateUser);
    }
    return const HomePage();
    print("Done");

  }
}
