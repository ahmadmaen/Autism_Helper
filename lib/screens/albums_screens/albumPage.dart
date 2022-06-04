// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/album.dart';
import '../common_widgets/profile_picture.dart';




class AlbumPage extends StatefulWidget {
   const AlbumPage({Key? key , required this.album, required this.user}) : super(key: key);

  final Album album;
   final User1 user;

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Center(child: Center(
          child: Text(
            widget.album.label ,
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
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, right: 5, left: 5),
              child: ProfilePicture(
                pictureUrl: widget.user.userProfilePictureUrl,
                pictureSize: 30,
                pictureRadius: 60,
              ),
            ),
          ), //(ProfilePicture)
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
