// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/user.dart';
import '../common_widgets/profile_picture.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, required this.user}) : super(key: key);
  final User1 user;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  late Image image;
  UploadTask? task;
  PlatformFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    image = Image.network(widget.user.userProfilePictureUrl);
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Edit Profile Page',
              style: GoogleFonts.abel(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
                  picture: Image.network(widget.user.userProfilePictureUrl),
                  pictureSize: 30,
                  pictureRadius: 20,
                ),
              ),
            ), //(ProfilePicture)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ProfilePicture(
                        pictureSize: 130,
                        pictureRadius: 200,
                        picture: image,
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: CircleAvatar(
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white70,
                              size: 23,
                            ),
                            onPressed: () => yourChoice(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.user.name,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  SizedBox(height: 25),
                  Container(
                    child: Text('Name :'),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 7),
                  ),
                  buildNameField(),
                  SizedBox(height: 15),
                  Container(
                    child: Text('Email :'),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 7),
                  ),
                  buildEmailField(),
                  SizedBox(height: 15),
                  Container(
                    child: Text('Password :'),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 7),
                  ),
                  buildPasswordField(),
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              "CANCEL",
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
                            onPressed: () {
                              saveEntries();
                            },
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
        ));
  }

  Padding buildNameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        controller: TextEditingController()..text = widget.user.name,
        onChanged: (text) => {},
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: UnderlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 20),
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        controller: TextEditingController()..text = widget.user.email,
        onChanged: (text) => {},
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 20),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextButton(onPressed: () {  },
      child: Text('Change Your Password'),
      ),
    );
  }

  void saveEntries() {}

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
    String imageUrl;
    try {

      var newImage = await ImagePicker().pickImage(source: source);//getting picture from phone

      var imageFile = File(newImage!.path);

      String fileName = basename(imageFile.path);

      Reference storageRef = FirebaseStorage.instance.ref().child("UsersProfilePhoto/Image-$fileName");

      UploadTask uploadTask = storageRef.putFile(imageFile);


      await uploadTask.whenComplete(() async {
        var url = await storageRef.getDownloadURL();
        imageUrl = url.toString();
      }).catchError((onError) {
        print(onError);
      });

    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}











