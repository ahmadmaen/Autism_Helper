// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/album.dart';
import '../../models/picture.dart';
import '../../services/database.dart';
import '../common_widgets/buttons/raised_button.dart';
import '../common_widgets/profile_picture.dart';




class AlbumPage extends StatefulWidget {
   const AlbumPage({Key? key , required this.album, required this.user, required this.database}) : super(key: key);

  final Album album;
  final User1 user;
  final Database database;

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
    final Stream<QuerySnapshot> _pictureStream = widget.database.readPicture(widget.album.id) as Stream<QuerySnapshot>;
    return StreamBuilder<QuerySnapshot>(
        stream: _pictureStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                Picture picture = Picture.fromMap(data);
                return SizedBox(
                      width: 150,
                      child: CustomRaisedButton(
                        onPressed: (){} ,
                        child: Image.network(
                          picture.pictureUrl,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    );
              }).toList(),
            ),
          );
        });
  }
}
