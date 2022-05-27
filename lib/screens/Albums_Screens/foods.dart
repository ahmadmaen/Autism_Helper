// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/database.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/profile_picture.dart';
import 'package:flutter/material.dart';

class Foods extends StatelessWidget {
  const Foods({Key? key}) : super(key: key);

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
            onTap:(){} /*_signOut*/,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, right: 5, left: 5),
              child: ProfilePicture(
                pictureUrl: defaultUser.userProfilePictureUrl,
                pictureSize: 30,
              ),
            ),
          ),//(ProfilePicture)
        ],
      ),
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildContent(),
        ),
      )),
    );

  }
  Widget _buildContent() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                child: Image.network(
                  pictures[index].pictureUrl,
                  width: 400,
                  height:120,
                ),
              ), //(Picture)
            ],
          );
        });
  }

}
