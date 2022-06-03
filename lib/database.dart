import 'package:autism_helper_project/models/picture.dart';
import 'package:autism_helper_project/models/user.dart';
import 'dart:math';

int albumId = 0;
var rand = Random();
User1 defaultUser = User1(
    name: 'Fawwaz',
    userProfilePictureUrl: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
);

const List<Picture> pictures = [
  Picture(
      pictureLabel: 'Pizza',
      pictureUrl:
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHBpenphJTIwY2FydG9vbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      pictureId: 1),
  Picture(
      pictureLabel: 'Burger',
      pictureUrl:
      'https://images.unsplash.com/photo-1607013251379-e6eecfffe234?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      pictureId: 1),
  Picture(
      pictureLabel: 'Shawarma',
      pictureUrl:
      'https://images.unsplash.com/photo-1633896949673-1eb9d131a9b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hhd2FybWF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      pictureId: 1),
];
