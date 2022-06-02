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
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid}) : assert(uid != null);

  final String? uid;
  final _service = FirestoreService.instance;

  @override
  Future<void> setUserData(User1 user) async => _service.setData(
        path: APIPath.user(uid),
        data: user.toMap(),
      );

  @override
  Stream<List<Album>> readAlbums() => _service.collectionStream
    (
      path:  APIPath.album(),
      builder: (data) => Album.fromMap(data));
}
