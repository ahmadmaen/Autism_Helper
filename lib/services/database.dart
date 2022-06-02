import 'dart:core';

import 'package:autism_helper_project/models/album.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:flutter/foundation.dart';

import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setUserData(User1 user);
  Stream<List<Album>?> readAlbums();
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
  Stream<List<Album>?> readAlbums() {
    final path = APIPath.album();
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();

    String word='aa';

    print(word);

    snapshots.listen((snapshot) {
      for (var snapshot in snapshot.docs) {
        word = snapshot.data()['Label'];
        print(word);
      }
    });


    Stream<List<Album>> albums = snapshots.map((snapshot) => snapshot.docs.map(
          (snapshot) {
          var data = snapshot.data();
          word = data['Label'];
          return Album(
            label: data['Label'],
            url: data['URL'],
            albumColor: int.parse(data['Color']),
          );
        },
      ).toList());


    albums.listen((event) {
      for (Album albums in event) {
        if(event.isEmpty) {
          print('suii');
        }
      }
    });

    print(word);

    return albums;
  }
}
