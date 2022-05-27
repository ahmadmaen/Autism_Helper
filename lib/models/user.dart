import 'package:autism_helper_project/models/album.dart';
import 'package:flutter/material.dart';

class User {
  final String firstName;
  final String lastName;
  final int id;
  final String email;
  final String password;
  final int age;
  final double numberPhone;
  final String profilePictureUrl;
  final List<Album> albums;
  final List<Image> images;

  const User({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.email,
    required this.password,
    required this.age,
    required this.numberPhone,
    this.profilePictureUrl = 'images/defaultProfile.png',
    this.albums = const [],
    this.images = const [],
  });
}
