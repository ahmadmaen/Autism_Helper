import 'dart:core';

import 'package:autism_helper_project/models/album.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:flutter/foundation.dart';

import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setUserData(User1 user);
  List<Album> readAlbums();
  /*Future<void> setJob(Job job);
  Future<void> deleteJob(Job job);
  Stream<List<Job>> jobsStream();
  Stream<Job> jobStream({@required String jobId});

  Future<void> setEntry(Entry entry);
  Future<void> deleteEntry(Entry entry);
  Stream<List<Entry>> entriesStream({Job job});*/
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
  List<Album> readAlbums() {
    final path = APIPath.album();
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();

    List<Album> albums=[];

    snapshots.listen((snapshot) {
      for (var snapshot in snapshot.docs) {
        if (kDebugMode) {
          print(snapshot.data());
        }
        final data = snapshot.data();
        albums.add(
            Album(
              label: data['Label'],
              url: data['URL'],
              albumColor: int.parse(data['Color']),
            )
        );
      }
    });

    snapshots.map((snapshot) {
      snapshot.docs.map(
            (snapshot) {
          final data = snapshot.data();
          return  Album(
            label: data['Label'],
            url: data['URL'],
            albumColor: int.parse(data['Color']),
          );
        },
      );
    });

    return albums;


  }
}
