import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/Buttons/RaisedButton.dart';
import '../../services/Auth.dart';



class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key, required this.auth}) : super(key: key);

  final AuthBase auth;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

   String get _email => _emailController.text;
   String get _password => _passwordController.text;


   Future<void> _signUpButton(BuildContext context) async {
     try {
       await auth.createUserWithEmailAndPassword(_email, _password);
       Navigator.of(context).pop();
     } on FirebaseAuthException catch (e) {
       print(e.toString());
     }
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('images/title.png', scale: 18)),
        actions: const [
          SizedBox(width: 50),
        ],
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
                 'Welcome !',
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
                     keyboardType: TextInputType.emailAddress,
                     textInputAction: TextInputAction.next,
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
                 onPressed: (){_signUpButton(context);},
               ),
               const SizedBox(height: 5),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:  signUpRowChildren(context),
               ),
             ]
         )
     );
   }

   List<Widget> signUpRowChildren(BuildContext context) {
     return [
       const Text(
         'already have an account',
         textAlign: TextAlign.center,
         style: TextStyle(
           color: Colors.black45,
           fontSize: 15.0,
           fontWeight: FontWeight.normal,
         ),
       ),
       FlatButton(
           onPressed: () {
             Navigator.of(context).pop();
           },
           child: const Text(
             'login here',
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

}


