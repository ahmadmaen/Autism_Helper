// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:autism_helper_project/screens/common_widgets/profile_picture.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';



class AddImage extends StatefulWidget {
  const AddImage({Key? key, required this.user}) : super(key: key);
  final User1 user;
  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  _AddImageState();
  String item = 'Choose Album';
  var labelBoxController = TextEditingController();


  // List of items in our dropdown menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          'Add a new image',
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
              Navigator.pop(context);
            }),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, right: 5, left: 5),
              child: ProfilePicture(
                picture: Image.network(defaultUser.userProfilePictureUrl),
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
              SizedBox(height: 100),
              Stack(
                children: [
                  ProfilePicture(
                    picture: Image.network('https://static.vecteezy.com/system/resources/previews/003/513/803/large_2x/single-banana-cartoon-illustration-isolated-free-vector.jpg'),
                    pictureSize: 130,
                    pictureRadius: 20,
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: CircleAvatar(
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white70,
                          size: 23,
                        ),
                        onPressed: () { yourChoice(context); },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildNameField(),
              SizedBox(height: 20),
              buildDropDown(),
              SizedBox(height: 50),
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
                          labelBoxController.clear();
                        },
                        child: Text(
                          "Reset",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(width: 100),
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

  void dropdownCallback(String? selectedValue ) {
    if(selectedValue is String ) {
      setState(() {
        item = selectedValue;
      });
    }}

  Card buildDropDown() {
    return Card(
        child:DropdownButton
          (
          value: item,
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

  void saveEntries() {}

  void yourChoice(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
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
        ]));
  }

  Future selectImage(ImageSource source) async {
    try {
      final img = (await ImagePicker().pickImage(source: source)) ;
      final path = 'files/${img!.name}';
      final file = File(img.path);
      final ref = FirebaseStorage.instance.ref().child(path);
      ref.putFile(file);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to choose an image: $e');
      }
    }
  }

}
