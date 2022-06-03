// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:autism_helper_project/screens/common_widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/user.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key, required this.user}) : super(key: key);
  final User1 user;


  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Center(
            child: Text(
              'Contact Us',
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
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: 5, left: 5),
                child: ProfilePicture(
                  pictureUrl: widget.user.userProfilePictureUrl,
                  pictureSize: 30, pictureRadius: 60,
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
                Image.asset('images/logo.png',scale: 4),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Contact Us',
                    style: GoogleFonts.abel(
                        fontSize: 30,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Write a note for us, and we will contact you :',
                    style: GoogleFonts.abel(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                buildNameCard(context),
                SizedBox(height: 5),
                buildEmailCard(context),
                SizedBox(height: 5),
                buildTextCard(context),
                SizedBox(height: 25),
                SizedBox(
                  width: 120,
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
                        "SEND",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                ),

              ],
            ),
          ),
        ));
  }

  Card buildEmailCard(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: TextField(
          textAlign: TextAlign.start,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Your Email',
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }

  Card buildNameCard(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: TextField(
          textAlign: TextAlign.start,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Your Name',
          ),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }

  SizedBox buildTextCard(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        semanticContainer: true,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextField(
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Your Message',
            ),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.next,
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}
