// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:autism_helper_project/screens/common_widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AddImage extends StatefulWidget {
  const AddImage({Key? key, required this.user}) : super(key: key);
  final User1 user;
  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  _AddImageState();
  String item = 'Choose';

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
                pictureUrl: defaultUser.userProfilePictureUrl,
                pictureSize: 30,
                pictureRadius: 60,
              ),
            ),
          ), //(ProfilePicture)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
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
                      onPressed: () {Navigator.pop(context);},
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
                      onPressed: () {},
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

  void dropdownCallback(String? selectedValue)
  {
    if(selectedValue is String) {
      setState(() {
        item = selectedValue;
      });
    }
  }

  Card buildDropDown()
  {
    return Card(
        child:DropdownButton
          (
          items: [
            DropdownMenuItem(child: Text('Item0'),value: 'Item0',),
            DropdownMenuItem(child: Text('Item1'),value: 'Item2',),
            DropdownMenuItem(child: Text('Item2'),value: 'Item3',),
            DropdownMenuItem(child: Text('Item3'),value: 'Item4',),
            DropdownMenuItem(child: Text('Item4'),value: 'Item5',),
            DropdownMenuItem(child: Text('Item5'),value: 'Item6',),
          ],
          onChanged:dropdownCallback,
        )
    );

  }
}
