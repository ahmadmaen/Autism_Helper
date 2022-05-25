
import 'package:autism_helper_project/models/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../common_widgets/Buttons/RaisedButton.dart';
import 'SignUpPage.dart';

class SignInPage extends StatelessWidget {
   SignInPage({Key? key, required this.auth}) : super(key: key);


  final AuthBase auth;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  Future<void> _signInwWthAnonymous() async {
    try {
      await auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInButton() async {
    try {
      await auth.signInWithEmailAndPassword(_email, _password);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void _signUpButton(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) =>  SignUpPage(auth: auth),
        ),
    );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('images/title.png', scale: 18)),
        elevation: 10.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
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
            Card(
              elevation: 2,
              child:  Padding(
                padding: const EdgeInsets.only(left: 16.0 ),
                child : TextField(
                  controller: _emailController,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText:'Email',
                  ),
                ),
              ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0 ),
                child : TextField(
                  controller: _passwordController,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText:'Password',
                  ),
                  obscureText: true,
                ),
              ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
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
              onPressed: _signInButton,
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
              children: signInWithRowChildren(),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  signUpRowChildren(context),
            ),
            const SizedBox(height: 5),
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

  List<Widget> signUpRowChildren(BuildContext context) {
    return [
              const Text(
                'Don\'t have an account? ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              FlatButton(
                  onPressed: () {_signUpButton(context); },
                  child: const Text(
                    'Sign up here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                  )
              ),
            ];
  }

  List<Widget> signInWithRowChildren() {
    return <Widget>[
              //const SizedBox(width: 30),
              CustomRaisedButton(
                  onPressed: () {},
                  color: Colors.white,
                  child: SizedBox(
                    height: 25,
                    child: Image.asset('images/twitter.png'),
                  )
              ),
              const SizedBox(width: 35),
              CustomRaisedButton(
                  onPressed: () {},
                  color: Colors.white,
                  child: SizedBox(
                    height: 25,
                    child: Image.asset('images/Facebook.png'),
                  )
              ),
              const SizedBox(width: 35),
              CustomRaisedButton(
                  onPressed: _signInWithGoogle,
                  color: Colors.white,
                  child: SizedBox(
                    height: 25,
                    child: Image.asset('images/google.png'),
                  )
              ),
            ];
  }


}
