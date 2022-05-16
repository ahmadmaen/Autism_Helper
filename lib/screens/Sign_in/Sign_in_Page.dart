import 'package:flutter/material.dart';

import '../../common_widgets/Buttons/RaisedButton.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('images/title.png', scale: 18)),
        elevation: 10.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              child: Image.asset('images/Logo2.png'),
              height: 150.0,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome Back!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Login to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'UserName',),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Password',),
            ),
            const SizedBox(height: 20),
            CustomRaisedButton(
              child: const Text(
                  'Sign in',
                  style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17, ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '--------------------- Or sign in with ---------------------',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            CustomRaisedButton(
              child: const Text(
                'Sign in',
                style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17, ),
              ),
            ),
          ],
        )
    );
  }
  void _SignIn() {

  }
  void _SignInWithGoogle() {

  }
}
