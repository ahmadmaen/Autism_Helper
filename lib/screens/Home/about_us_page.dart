// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/screens/Home/home_page.dart';
import 'package:autism_helper_project/screens/common_widgets/profile_picture.dart';
import 'package:autism_helper_project/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Center(
            child: Text(
              'About Us',
              style: GoogleFonts.abel(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem veniam nobis, nisi ut expedita, doloribus reprehenderit explicabo non velit repellat alias saepe inventore repellendus? Molestias suscipit eos tempora? Quae quaerat cumque in veritatis.',
                    style: GoogleFonts.abel(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Image.asset('images/logo.png',scale: 4),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Email : fawwaztopasy0000@gmail.com\n\nPhone :+962787766235\n\nAddress : Jordan - Irbid',
                    style: GoogleFonts.abel(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}