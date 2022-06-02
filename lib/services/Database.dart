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

  Stream<List<Album>> readAlbums() {
    final path = APIPath.album();
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) {
      snapshot.docs.map(
            (snapshot) {
          final data = snapshot.data();
          return Album(
            label: data['Label'],
            url: 'https://firebasestorage.googleapis.com/v0/b/autismhelperdatabase.appspot.com/o/Drink.png?alt=media&token=23e1fae2-72c8-4cbf-aeaa-e61383c55762',
            albumColor: int.parse(data['Color']),
          );
        },
      );
      return <Album>[];
    });
    }
}
