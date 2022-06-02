// ignore_for_file: prefer_const_constructors


import 'dart:io';

import 'package:autism_helper_project/screens/profile/profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/user.dart';
import '../common_widgets/profile_picture.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ImagePicker _picker = ImagePicker();

  User1 user = User1(
      name : 'Ahmad Maen',
      userProfilePictureUrl :'https://firebasestorage.googleapis.com/v0/b/autismhelperdatabase.appspot.com/o/me.jpg?alt=media&token=4f1810e4-1405-458c-b83d-1f490c011ecf'
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text( 'Edit Profile Page',
            style: GoogleFonts.abel(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true, builder: (_) => const ProfilePage())),
              child: Padding(
                padding:
                const EdgeInsets.only(top: 12, bottom: 12, right: 5, left: 5),
                child: ProfilePicture(
                  pictureUrl: user.userProfilePictureUrl,
                  pictureSize: 30,
                ),
              ),
            ), //(ProfilePicture)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ProfilePicture(
                        pictureUrl: user.userProfilePictureUrl,
                        pictureSize: 130,
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: CircleAvatar(
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white70,
                              size: 23,
                            ),
                            onPressed: () {
                              _getFromGallery();
                            },
                          ),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    user.name,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  SizedBox(height: 25),
                  Container(child: Text('Name :'),alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 7 ),),
                  buildNameField(),
                  SizedBox(height: 15),
                  Container(child: Text('Email :'),alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 7 ),),
                  buildEmailField(),
                  SizedBox(height: 15),
                  Container(child: Text('Password :'),alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 7 ),),
                  buildPasswordField(),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 40.0,
                          child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "CANCEL",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                      SizedBox(width: 100),
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 40.0,
                          child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "SAVE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                    ],
                  ),
                ],
              ),

            ),
          ),
        ));
  }

  Padding buildNameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      child: TextFormField(
        controller: TextEditingController()..text = user.name,
        onChanged: (text) => {},
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: UnderlineInputBorder(),
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
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      child: TextFormField(
        controller: TextEditingController()
          ..text = user.userEmail,
        onChanged: (text) => {},
        decoration: const InputDecoration(
          border:  UnderlineInputBorder(),
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
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      child: TextFormField(
        controller: TextEditingController()..text = user.userPassword,
        onChanged: (text) => {},
        decoration: const InputDecoration(
          border:  UnderlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 20),

        ),
        obscureText: true,
      ),
    );
  }

   Future _getFromGallery() async {
     var status = await Permission.storage.status;
     if (status.isDenied) {
       if (kDebugMode) {
         print('You Denied the Permission');
       }
     }
     else if (await Permission.location.isRestricted) {
       if (kDebugMode) {
         print('You Restricted the Permission');
       }

     }
     else if (await Permission.contacts.request().isGranted) {
       try {
        final image = (await ImagePicker().pickImage(
           source: ImageSource.gallery,
           maxWidth: 1800,
           maxHeight: 1800,
         ));
         if (image != null) {
           setState(() {
             File imageFile = File(image.path);
           });
         }
       } on Exception catch (e) {
         if (kDebugMode) {
           print(Error);
         }
       }
       }

     }
  }

  /* void _updateState() {
    setState(() {});
  }
  */

