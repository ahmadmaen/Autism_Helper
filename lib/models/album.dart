import 'package:flutter/material.dart';

enum Group { me, person, game, feelings, food, drink, place }

class Album {
  final String name;
  final String picture;
  final int albumId;
  final Color albumColor;
  final List<Image> images;
  Album({
    required this.name,
    required this.picture,
    required this.albumId,
    this.albumColor = Colors.white,
    this.images = const [],
  });
}
