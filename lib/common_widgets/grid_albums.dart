// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/database.dart';
import 'package:autism_helper_project/screens/Albums_Screens/drinks.dart';
import 'package:autism_helper_project/screens/Albums_Screens/feelings.dart';
import 'package:autism_helper_project/screens/Albums_Screens/foods.dart';
import 'package:autism_helper_project/screens/Albums_Screens/games.dart';
import 'package:autism_helper_project/screens/Albums_Screens/persons.dart';
import 'package:autism_helper_project/screens/Albums_Screens/places.dart';
import 'package:flutter/material.dart';

class GridAlbums extends StatelessWidget {
  const GridAlbums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        return Drinks();
      case 5:
        return Places();
      default:
        return Places();
    }
  }
}
