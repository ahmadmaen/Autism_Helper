import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../common_widgets/Buttons/RaisedButton.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.onSignIn}) : super(key: key);

  final void Function(User?) onSignIn;

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
              height: 80.0,
            ),
            const SizedBox(height: 15),
            const Text(
              'Welcome Back!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 25.0,
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
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'UserName',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            CustomRaisedButton(
              child: const Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              onPressed: () {},
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //const SizedBox(width: 30),
                CustomRaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    child: SizedBox(
                      height: 25,
                      child: Image.asset('images/twitter.png'),
                    )),
                const SizedBox(width: 35),
                CustomRaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    child: SizedBox(
                      height: 25,
                      child: Image.asset('images/Facebook.png'),
                    )),
                const SizedBox(width: 35),
                CustomRaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    child: SizedBox(
                      height: 25,
                      child: Image.asset('images/google.png'),
                    )),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Don\'t have an account? Sign up here',
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
                'go anonymous',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              onPressed: _signInwWthAnonymous,
            ),
          ],
        ));
  }

  void _signIn() {}

  Future<void> _signInwWthAnonymous() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(userCredential.user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}
