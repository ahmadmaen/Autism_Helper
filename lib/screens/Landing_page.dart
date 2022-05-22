import 'package:autism_helper_project/screens/Sign_in/sign_in_page.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateUser(FirebaseAuth.instance.currentUser);
  }


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
      return SignInPage(
          onSignIn: _updateUser);
    }
    return HomePage(
      onSignOut: () => _updateUser(null),
    );
  }
}
