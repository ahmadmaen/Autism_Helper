import 'package:autism_helper_project/models/picture.dart';
import 'package:flutter/material.dart';
import 'package:autism_helper_project/models/album.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:flutter/cupertino.dart';
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

List<Album> albums = [
  Album(
      albumId: albumId++,
      albumName: 'Foods',
      albumPictureUrl: 'images/foods.png',
      albumColor: const Color(0xFFFFFF6F)),
  Album(
      albumId: albumId++,
      albumName: 'Games',
      albumPictureUrl: 'images/games.png',
      albumColor: const Color(0xFF28FE6F)),
  Album(
      albumId: albumId++,
      albumName: 'Persons',
      albumPictureUrl: 'images/persons.png',
      albumColor: const Color(0xFFE4E4E4)),
  Album(
      albumId: albumId++,
      albumName: 'Feelings',
      albumPictureUrl: 'images/feelings.png',
      albumColor: const Color(0xFFFE9F00)),
  Album(
    albumId: albumId++,
    albumName: 'Drinks',
    albumPictureUrl: 'images/drinks.png',
  ),
  Album(
      albumId: albumId++,
      albumName: 'Places',
      albumPictureUrl: 'images/places.png',
      albumColor: const Color(0xFFE4E4E4)),
  Album(
    albumId: albumId++,
    albumName: 'Others',
    albumPictureUrl: 'images/others.png',
  ),
  Album(
    albumId: albumId++,
    albumName: 'Others',
    albumPictureUrl: 'images/others.png',
  ),
];