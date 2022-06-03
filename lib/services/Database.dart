import 'dart:core';

import 'package:autism_helper_project/models/album.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:flutter/foundation.dart';

import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setUserData(User1 user);
  Stream<List<Album>> readAlbums();
  Stream<User1> readUser() ;
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid}) : assert(uid != null);

  final String? uid;
  final _service = FirestoreService.instance;

  String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

  @override
  Future<void> setUserData(User1 user) async => _service.setData(
        path: APIPath.user(uid),
        data: user.toMap(),
      );

  @override
   Stream<User1> readUser() => _service.documentStream(
      path: APIPath.user(uid),
      builder: (data,uid) => User1.fromMap(data,uid),
  );

  @override
  Stream<List<Album>> readAlbums() => _service.collectionStream
    (
      path:  APIPath.albums(),
      builder: (data) => Album.fromMap(data));
}
