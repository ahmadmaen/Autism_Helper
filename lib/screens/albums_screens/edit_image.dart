// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:autism_helper_project/screens/common_widgets/profile_picture.dart';
import 'package:autism_helper_project/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../models/picture.dart';
import '../../models/user.dart';



class EditImage extends StatefulWidget {
  EditImage({Key? key, required this.picture, required this.user, required this.database }) : super(key: key);

  final Picture picture;
  final User1 user;
  final Database database;


  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {

  String item = 'Choose Album';
  late Picture picture;

  // List of items in our dropdown menu
  @override
  Widget build(BuildContext context) {
    picture = widget.picture;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          'Edit an image',
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
              Navigator.pop(context,picture);
            }),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, right: 5, left: 5),
              child: ProfilePicture(
                picture: Image.network(widget.user.userProfilePictureUrl),
                pictureSize: 30,
                pictureRadius: 60,
              ),
            ),
          ), //(ProfilePicture)
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              Stack(
                children: [
                  ProfilePicture(
                    picture:
                    Image.network(picture.pictureUrl),
                    pictureSize: 220,
                    pictureRadius: 20,
                  ),
                  Positioned(
                    bottom: 1,
                    right: 10,
                    child: CircleAvatar(
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white70,
                          size: 23,
                        ),
                        onPressed: () { yourChoice(context);},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildNameField(),
              SizedBox(height: 20),
              buildDropDown(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        onPressed: () {
                          Navigator.pop(context,picture);

                          },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(width: 125),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        onPressed: () { saveEntries(); },
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildNameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            textAlign: TextAlign.center,
            controller: TextEditingController()..text = widget.picture.pictureLabel,
            onChanged: (text) => {},
            decoration: InputDecoration.collapsed(
              border: InputBorder.none,
              hintText: 'Image Label',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
    );
  }

  void dropdownCallback(String? selectedValue) {
    if(selectedValue is String) {
      setState(() {
        item = selectedValue;
      });
    }
  }

  Card buildDropDown() {
    return Card(
        child:DropdownButton
          (
          value:item,
          items: [
            DropdownMenuItem(child: Text('Choose Album'),value: 'Choose Album',),
            DropdownMenuItem(child: Text('Persons'),value: 'Persons',),
            DropdownMenuItem(child: Text('Feelings'),value: 'Feelings',),
            DropdownMenuItem(child: Text('Places'),value: 'Places',),
            DropdownMenuItem(child: Text('Games'),value: 'Games',),
            DropdownMenuItem(child: Text('Drinks'),value: 'Drinks',),
            DropdownMenuItem(child: Text('Foods'),value: 'Foods',),

          ],
          onChanged:dropdownCallback,
        )
    );

  }

  void yourChoice(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () => Navigator.of(context).pop(selectImage(ImageSource.camera)) ,
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () => Navigator.of(context).pop(selectImage(ImageSource.gallery)),
              )
            ]
        )
    );
  }

  Future selectImage(ImageSource source) async {
    String imageUrl="";
    try {

      var newImage = await ImagePicker().pickImage(source: source);//getting picture from phone

      var imageFile = File(newImage!.path);

      String fileName = basename(imageFile.path);

      Reference storageRef = FirebaseStorage.instance.ref().child("UserImage/$fileName");

      UploadTask uploadTask = storageRef.putFile(imageFile);


      await uploadTask.whenComplete( () async {
        var url = await storageRef.getDownloadURL();
        imageUrl = url.toString();
      }).catchError( (onError) {
        if (kDebugMode) {  print(onError);   }
      });


      picture.pictureUrl = imageUrl;
      widget.database.updateImage(picture);
      setState((){});


    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  void resetEntries() {}

  void saveEntries() {}

}