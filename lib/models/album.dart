import 'package:autism_helper_project/models/picture.dart';
import 'package:flutter/material.dart';

//enum Group { me, person, game, feelings, food, drink, place }

class Album {
  Album({ required this.label,  required this.url,  required this.albumColor, this.pictures = const [],});

  final String label;
  final String url;
  int albumColor = 0xFFFFFFFF;

  final List<Picture> pictures;




}


