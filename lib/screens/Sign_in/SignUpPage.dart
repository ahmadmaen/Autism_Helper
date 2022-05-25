import 'package:flutter/material.dart';

import '../../common_widgets/Buttons/RaisedButton.dart';
import '../../models/Auth.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key, required this.auth}) : super(key: key);

  final AuthBase auth;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
                 'Create your account',
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
                 child: Padding(
                   padding: const EdgeInsets.only(left: 16.0),
                   child: TextField(
                     controller: _emailController,
                     textAlign: TextAlign.start,
                     decoration: const InputDecoration(
                       border: InputBorder.none,
                       hintText: 'Email',
                     ),
                   ),
                 ),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0)),
               ),
               Card(
                 elevation: 2,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 16.0),
                   child: TextField(
                     controller: _passwordController,
                     textAlign: TextAlign.start,
                     decoration: const InputDecoration(
                       border: InputBorder.none,
                       hintText: 'Password',
                     ),
                     obscureText: true,
                   ),
                 ),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0)),
               ),
               const SizedBox(height: 20),
               CustomRaisedButton (
                 child: const Text(
                   'Sign Up',
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 17,
                   ),
                 ),
                 onPressed: () {},
               ),
               const SizedBox(height: 10),
             ]));
   }
}


