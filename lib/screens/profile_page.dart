// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/common_widgets/profile_picture.dart';
import 'package:autism_helper_project/database.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                ProfilePicture(
                  pictureUrl: defaultUser.userProfilePictureUrl,
                  pictureSize: 130,
                ),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: CircleAvatar(
                    child: IconButton(
                      icon: Icon(
                        Icons.photo_camera_outlined,
                        color: Colors.white70,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    backgroundColor: Colors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20 ),
            Text(
              defaultUser.userName,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
            ),
            SizedBox(height: 20),
            buildNameField(),
            SizedBox(height: 20),
            buildEmailField(),
            SizedBox(height: 20),
            buildPasswordField(),
            SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }

  Padding buildNameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: TextEditingController()..text = '\n'+defaultUser.userName,
        onChanged: (text) => {},
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 20),
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  Padding buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: TextEditingController()..text = '\n'+ defaultUser.userEmail,
        onChanged: (text) => {},
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Email',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 20),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  Padding buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: TextEditingController()..text = defaultUser.userPassword,
        onChanged: (text) => {},
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 20),
        ),
        obscureText: true,

      ),
    );
  }

 /* void _updateState() {
    setState(() {});
  }
  */

}
