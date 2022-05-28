


import 'package:autism_helper_project/Services/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/Buttons/RaisedButton.dart';
import '../../common_widgets/ShowAlertDialog.dart';
import 'SignUpPage.dart';
import 'Validator.dart';


class SignInPage extends StatelessWidget with EmailAndPasswordValidators {
   SignInPage({Key? key}) : super(key: key);




  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();


  String get _email => _emailController.text;
  String get _password => _passwordController.text;

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
            logoBox(),
            const SizedBox(height: 15),
            welcomeBackText(),
            const SizedBox(height: 10),
            logInToYourAccountText(),
            const SizedBox(height: 10),
            buildEmailCard(context),
            buildPasswordCard(),
            const SizedBox(height: 20),
            CustomRaisedButton(
              child: signInButtonLabel(),
              onPressed: (){  _signInButton(context); },
            ),
            const SizedBox(height: 10),
            signInWithText(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: signInWithRowChildren(context),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  signUpRowChildren(context),
            ),
            const SizedBox(height: 5),
            CustomRaisedButton(
              child: const Text(
                'Continue without an account',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              onPressed: (){_signInwWthAnonymous(context);},
            ),
          ],
        ));
  }



  SizedBox logoBox() {
    return SizedBox(
            child: Image.asset('images/Logo2.png'),
            height: 80.0,
          );
  }

  Text welcomeBackText() {
     return const Text(
       'Welcome Back!',
       textAlign: TextAlign.center,
       style: TextStyle(
         color: Colors.black45,
         fontSize: 25.0,
         fontWeight: FontWeight.normal,
       ),
     );
   }

  Text logInToYourAccountText() {
    return const Text(
            'Login to your account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
            ),
          );
  }

  void _emailEditingComplete(BuildContext context) {
     /*final newFocus = emailValidator.isValid(_email)
         ? _passwordFocusNode
         : _emailFocusNode;*/
     FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  Card buildEmailCard(BuildContext context) {
    bool emailValid = emailValidator.isValid(_email);
    return Card(
            elevation: 2,
            child:  Padding(
              padding: const EdgeInsets.only(left: 16.0 ),
              child : TextField(
                controller: _emailController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:'Email',
                  errorText: true ? null  : invalidEmailErrorText,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: _emailFocusNode,
                onEditingComplete: (){_emailEditingComplete(context);},
              ),
            ),
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
          );
  }

  Card buildPasswordCard() {
    bool passwordValid = passwordValidator.isValid(_password);
     return Card(
       elevation: 2,
       child: Padding(
         padding: const EdgeInsets.only(left: 16.0 ),
         child : TextField(
           controller: _passwordController,
           textAlign: TextAlign.start,
           decoration:  InputDecoration(
             border: InputBorder.none,
             hintText:'Password',
             errorText: true ? null  : invalidPasswordErrorText,
           ),
           obscureText: true,
           focusNode: _passwordFocusNode,
         ),
       ),
       shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
     );
  }

  Text signInButtonLabel() {
     return const Text(
       'Sign in',
       style: TextStyle(
         color: Colors.white,
         fontWeight: FontWeight.bold,
         fontSize: 17,
       ),
     );
   }

  Future<void> _signInButton(BuildContext context) async {
    final AuthBase? auth = Provider.of<AuthBase>(context ,listen: false);
    try {
       await auth?.signInWithEmailAndPassword(_email, _password);
     } on FirebaseAuthException catch (e) {
      showAlertDialog (
        context,
        content: e.toString(),
        title: "Sign in failed",
        cancelActionText: "",
        defaultActionText: "OK",
      );
     }
   }

  Text signInWithText() {
     return const Text(
       '--------------------- Or sign in with ---------------------',
       textAlign: TextAlign.center,
       style: TextStyle(
         color: Colors.black45,
         fontSize: 15.0,
         fontWeight: FontWeight.normal,
       ),
     );
   }

  //////////////////////////////////////////////////////

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

  List<Widget> signInWithRowChildren(BuildContext context) {
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
                  onPressed: (){_signInWithGoogle(context);},
                  color: Colors.white,
                  child: SizedBox(
                    height: 25,
                    child: Image.asset('images/google.png'),
                  )
              ),
            ];
  }

  ////////////////////////////////////////////////////////

  Future<void> _signInwWthAnonymous(BuildContext context) async {
    final AuthBase? auth = Provider.of<AuthBase>(context ,listen: false);
     try {
       await auth?.signInAnonymously();
     } on FirebaseAuthException catch (e) {
       print(e.toString());
     }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final AuthBase? auth = Provider.of<AuthBase>(context ,listen: false);
    try {
      await auth?.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void _signUpButton(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) =>  SignUpPage(),
    ),);
   }



}
