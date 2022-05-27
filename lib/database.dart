import 'package:autism_helper_project/models/picture.dart';
import 'package:flutter/material.dart';
import 'package:autism_helper_project/models/album.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:flutter/cupertino.dart';

int albumId = 0;
const User defaultUser = User(
    firstName: 'Fawwaz',
    lastName: 'Tobasi',
    id: 135209,
    email: 'fawwaz@gmail.com',
    password: '123',
    age: 23,
    numberPhone: 0787777777,
    profilePictureUrl:
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80');

const List<Picture> images = [
  Picture(
      label: 'Pizza',
      url:
          'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHBpenphJTIwY2FydG9vbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      albumId: 0),
  Picture(
      label: 'Burger',
      url:
          'https://images.unsplash.com/photo-1607013251379-e6eecfffe234?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      albumId: 0),
  Picture(
      label: 'Shawarma',
      url:
          'https://images.unsplash.com/photo-1633896949673-1eb9d131a9b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hhd2FybWF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      albumId: 0),
];

List<Album> albums = [
  Album(
      albumId: albumId++,
      name: 'Foods',
      picture: 'images/foods.png',
      albumColor: const Color(0xFFFFFF6F)),
  Album(
      albumId: albumId++,
      name: 'Games',
      picture: 'images/games.png',
      albumColor: const Color(0xFF28FE6F)),
  Album(
      albumId: albumId++,
      name: 'Persons',
      picture: 'images/persons.png',
      albumColor: const Color(0xFFE4E4E4)),
  Album(
      albumId: albumId++,
      name: 'Feelings',
      picture: 'images/feelings.png',
      albumColor: const Color(0xFFFE9F00)),
  Album(albumId: albumId++, name: 'Drinks', picture: 'images/drinks.png'),
  Album(
      albumId: albumId++,
      name: 'Places',
      picture: 'images/places.png',
      albumColor: const Color(0xFFE4E4E4)),
  Album(albumId: albumId++, name: 'Others', picture: 'images/others.png'),
  Album(albumId: albumId++, name: 'Others', picture: 'images/others.png'),
];
