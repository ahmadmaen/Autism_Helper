// ignore_for_file: prefer_const_constructors


import 'package:autism_helper_project/models/user.dart';
import 'package:autism_helper_project/screens/common_widgets/profile_picture.dart';
import 'package:autism_helper_project/screens/profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  final User1 user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text( 'Profile Page',
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
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: 5, left: 5),
                child: ProfilePicture(
                  picture :Image.network(widget.user.userProfilePictureUrl),
                  pictureSize: 30,
                  pictureRadius: 60,
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
                  ProfilePicture(
                    picture :Image.network(widget.user.userProfilePictureUrl),
                    pictureSize: 130,
                    pictureRadius: 200,
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.user.name,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child:  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => EditProfilePage(user: widget.user)));
                                  },
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    size: 25,
                                  )))),
                    ),
                  ),
                  Container(child: Text('Name :',style: TextStyle(color: Colors.blueGrey),),alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 7 ),),
                  buildNameField(),
                  SizedBox(height: 15),
                  Container(child: Text('Email :' ,style: TextStyle(color: Colors.blueGrey),),alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 7),),
                  buildEmailField(),
                  SizedBox(height: 15),
                  Container(child: Text('Password :',style: TextStyle(color: Colors.blueGrey),),alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 7 ),),
                  buildPasswordField(),
                ],
              ),

            ),
          ),
        ));

  }


  Padding buildNameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: TextFormField(
        controller: TextEditingController()..text = widget.user.name,
        onChanged: (text) => {},
        enabled: false,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
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
        enabled: false,
        controller: TextEditingController()
          ..text = widget.user.userEmail,
        onChanged: (text) => {},
        decoration: const InputDecoration(
          border: InputBorder.none,
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
        enabled: false,
        controller: TextEditingController()..text = widget.user.userPassword,
        onChanged: (text) => {},
        decoration: const InputDecoration(
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 20),
        ),
        obscureText: true,
      ),
    );
  }
}

