// ignore_for_file: prefer_const_constructors


import 'package:autism_helper_project/models/user.dart';
import 'package:autism_helper_project/screens/common_widgets/profile_picture.dart';
import 'package:autism_helper_project/screens/profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User1 user = User1(
      name : 'Ahmad Maen',
      userProfilePictureUrl :'https://firebasestorage.googleapis.com/v0/b/autismhelperdatabase.appspot.com/o/me.jpg?alt=media&token=4f1810e4-1405-458c-b83d-1f490c011ecf'
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          'Profile Page',
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
      body: Center(
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
                            builder: (context) => EditProfilePage()));
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 25,
                      )))),
        ),
      ),
    );
  }
}

