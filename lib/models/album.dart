import 'package:autism_helper_project/models/picture.dart';
import 'package:flutter/material.dart';

//enum Group { me, person, game, feelings, food, drink, place }

class Album {
  final String albumName;
  final String albumPictureUrl;
  final int albumId;
  final Color albumColor;
  final List<Picture> pictures;
  Album({
    required this.albumName,
    required this.albumPictureUrl,
    required this.albumId,
    this.albumColor = Colors.white,
    this.pictures = const [],
  });
}
