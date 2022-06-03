// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/user.dart';
import '../common_widgets/profile_picture.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, required this.user}) : super(key: key);

  final User1 user;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  //final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Edit Profile Page',
              style: GoogleFonts.abel(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: 5, left: 5),
                child: ProfilePicture(
                  pictureUrl: widget.user.userProfilePictureUrl,
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
                        pictureUrl: widget.user.userProfilePictureUrl,
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
                            onPressed: () { },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.user.name,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  SizedBox(height: 25),
                  Container(
                    child: Text('Name :'),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 7),
                  ),
                  buildNameField(),
                  SizedBox(height: 15),
                  Container(
                    child: Text('Email :'),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 7),
                  ),
                  buildEmailField(),
                  SizedBox(height: 15),
                  Container(
                    child: Text('Password :'),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 7),
                  ),
                  buildPasswordField(),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                            ),
                            onPressed: () {Navigator.pop(context);},
                            child: Text(
                              "CANCEL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(width: 125),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                            ),
                            onPressed: () {},
                            child: Text(
                              "SAVE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
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
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        controller: TextEditingController()..text = widget.user.name,
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
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        controller: TextEditingController()..text = widget.user.userEmail,
        onChanged: (text) => {},
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
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
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        controller: TextEditingController()..text = widget.user.userPassword,
        onChanged: (text) => {},
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 20),
        ),
        obscureText: true,
      ),
    );
  }
}

/* void _updateState() {
    setState(() {});
  }
  */
