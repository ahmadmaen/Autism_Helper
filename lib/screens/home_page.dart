// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/Widgets/profile_picture.dart';
import 'package:autism_helper_project/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:autism_helper_project/screens/Albums_Screens/drinks.dart';
import 'package:autism_helper_project/screens/Albums_Screens/feelings.dart';
import 'package:autism_helper_project/screens/Albums_Screens/foods.dart';
import 'package:autism_helper_project/screens/Albums_Screens/games.dart';
import 'package:autism_helper_project/screens/Albums_Screens/persons.dart';
import 'package:autism_helper_project/screens/Albums_Screens/places.dart';

import '../models/Auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key,  required this.auth}) : super(key: key);



  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Image.asset('images/title.png', scale: 18)),
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
              onTap: _signOut,
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
        body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 7, 2, 7),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 2,
          ),
          itemCount: albums.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) => getScreen(index)
                  )),
                  child: Card(
                    color: albums[index].albumColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        albums[index].picture,
                        width: 165,
                        height: 170,
                      ),
                    ),
                  ),
                ), //(Picture)
              ],
            );
          }),
    );
  }

  Widget getScreen(int index) {
    switch(index) {
      case 0:
        return Foods();
      case 1:
        return Games();
      case 2:
        return Persons();
      case 3:
        return Feelings();
      case 4:
        return Drinks();
      case 5:
        return Places();
      default:
        return Places();
    }
  }

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}
