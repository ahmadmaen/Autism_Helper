// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/Widgets/grid_albums.dart';
import 'package:autism_helper_project/Widgets/profile_picture.dart';
import 'package:autism_helper_project/constants.dart';
import 'package:autism_helper_project/database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Image.asset('images/logo.png', scale: 18)),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: 5, left: 5),
                child: ProfilePicture(
                  pictureUrl: defaultUser.profilePictureUrl,
                  pictureSize: 30,
                ),
              ),
            ),//(ProfilePicture)
          ],
        ),
        body: GridAlbums());
  }
}
