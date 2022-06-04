// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:autism_helper_project/screens/albums_screens/add_image.dart';
import 'package:autism_helper_project/screens/albums_screens/edit_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class MyImages extends StatefulWidget {
   const MyImages({Key? key, required this.user}) : super(key: key);
   final User1 user;

   @override
  State<MyImages> createState() => _MyImagesState();
}

class _MyImagesState extends State<MyImages> {
  User1 user = User1(
      name: 'User',
      userProfilePictureUrl: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Center(child: Center(
          child: Text(
            'My Images' ,
            style: GoogleFonts.abel(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),),),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(onPressed: (){ Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true, builder: (context) => AddImage(user: user))); }, icon: Icon(Icons.add_box_outlined),color: Colors.black,) //(ProfilePicture)
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
          crossAxisCount: 2,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: (){ Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true, builder: (context) => EditImage(user: user,) )); },
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
