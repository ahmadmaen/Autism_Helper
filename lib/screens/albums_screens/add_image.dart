// ignore_for_file: prefer_const_constructors
import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/screens/common_widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile/edit_profile_page.dart';

class AddImage extends StatelessWidget {
  const AddImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          'Add a new image',
          style: GoogleFonts.abel(
              fontSize: 30,
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
                fullscreenDialog: true, builder: (_) => const EditProfilePage())),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, right: 5, left: 5),
              child: ProfilePicture(
                pictureUrl: defaultUser.userProfilePictureUrl,
                pictureSize: 30,
              ),
            ),
          ), //(ProfilePicture)
        ],
      ),
    );
  }
}
