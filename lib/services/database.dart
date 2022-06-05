import 'dart:core';

import 'package:autism_helper_project/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/picture.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setUserData(User1 user);


  Stream<dynamic> readAlbums();
  DocumentReference<Map<String, dynamic>> getUser();
  Stream<dynamic> readPicture(String id);


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
  Stream<dynamic> readAlbums() => _service.collectionStream(
    path: APIPath.albums(),
  );

  @override
  Stream<dynamic> readPicture(String id) {
    return FirebaseFirestore.instance.collection('Picture')
        .where('AlbumID', isEqualTo: id).snapshots();
  }


  @override
  DocumentReference<Map<String, dynamic>> getUser() => _service.getUser(
      path: APIPath.users(),
      documentID: uid!
  );







}
