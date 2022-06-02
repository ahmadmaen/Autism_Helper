// ignore_for_file: prefer_const_constructors


import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/screens/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:autism_helper_project/screens/Albums_Screens/drinks.dart';
import 'package:autism_helper_project/screens/Albums_Screens/feelings.dart';
import 'package:autism_helper_project/screens/Albums_Screens/foods.dart';
import 'package:autism_helper_project/screens/Albums_Screens/games.dart';
import 'package:autism_helper_project/screens/Albums_Screens/persons.dart';
import 'package:autism_helper_project/screens/Albums_Screens/places.dart';
import '../../Services/auth.dart';
import '../../services/Database.dart';
import '../common_widgets/profile_picture.dart';
import '../common_widgets/show_alert_dialog.dart';
import 'help_center_page.dart';
import 'package:autism_helper_project/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _icon = Icons.toggle_off_outlined;


  User1 user = User1(
      name : 'Ahmad Maen',
      userProfilePictureUrl :'https://firebasestorage.googleapis.com/v0/b/autismhelperdatabase.appspot.com/o/me.jpg?alt=media&token=4f1810e4-1405-458c-b83d-1f490c011ecf'
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('images/title.png', scale: 18)),
        leading: _menu(),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true, builder: (_) => ProfilePage())),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 12, bottom: 12, right: 5, left: 5),
              child: ProfilePicture(
                pictureUrl: user.userProfilePictureUrl,
                pictureSize: 30,
              ),
            ),
          ), //(ProfilePicture)
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
                      builder: (_) => getScreen(index))),
                  child: Card(
                    color: albums[index].albumColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        albums[index].albumPictureUrl,
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
    switch (index) {
      case 0:
        return Foods();
      case 1:
        return Games();
      case 2:
        return Persons();
      case 3:
        return Feelings();
      case 4:
         _setUserData(context);
         return Drinks();
      case 5:
        return Places();
      default:
        return Places();
    }
  }


  Future<void> _setUserData(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await database.setUserData(user);
  }

  Future<void> _signOut(BuildContext context) async {
    final AuthBase? auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth?.signOut();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          if (kDebugMode) {
            print("Anonymous auth hasn't been enabled for this project.");
          }
          break;
        default:
          if (kDebugMode) {
            print("Unknown error.");
          }
      }
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  PopupMenuButton _menu() {
    return PopupMenuButton(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 4.0,
        ),
        elevation: 20,
        offset: Offset(0, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Help Center"),
                value: 0,
              ),
              PopupMenuItem(
                child: Text("Sign Out"),
                value: 1,
              )
            ],
        onSelected: (result) {
          if (result == 0) { Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => HelpCenter()));
          }
      else if (result == 1) {
        _confirmSignOut(context);
      }
      }
    );
  }

  IconButton buildDarkModeButton() {
    return IconButton(
      icon: Icon(
        _icon,
        color: Colors.black,
        size: 50,
      ),
      onPressed: () {
        setState(() {
          if (_icon == Icons.toggle_off_outlined) {
            _icon = Icons.toggle_on_outlined;
            //themeChange.darkTheme = true;
          } else {
            _icon = Icons.toggle_off_outlined;
            //themeChange.darkTheme = false;
          }
        });
      },
    );
  }
}
