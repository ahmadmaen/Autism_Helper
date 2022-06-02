// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/screens/Home/help_center_page.dart';
import 'package:autism_helper_project/screens/common_widgets/show_alert_dialog.dart';
import 'package:autism_helper_project/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicWidget
{
  static PopupMenuButton menu(BuildContext context) {
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


  static Future<void>  _confirmSignOut(BuildContext context) async {
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

  static Future<void> _signOut(BuildContext context) async {
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
}