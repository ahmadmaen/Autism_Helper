// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:autism_helper_project/screens/common_widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class EditImage extends StatefulWidget {
  const EditImage({Key? key, required this.user}) : super(key: key);
  final User1 user;
  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  _EditImageState();
  String item = 'Choose Album';

  // List of items in our dropdown menu
  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(context);
            }),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, right: 5, left: 5),
              child: ProfilePicture(
                pictureUrl: defaultUser.userProfilePictureUrl,
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
                    pictureUrl: defaultUser.userProfilePictureUrl,
                    pictureSize: 130,
                    pictureRadius: 20,
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
                        onPressed: () { },
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
                        onPressed: () {resetEntries();},
                        child: Text(
                          "Reset",
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
            controller: TextEditingController()..text = widget.user.name,
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

  void resetEntries() {}
  void saveEntries() {}

}