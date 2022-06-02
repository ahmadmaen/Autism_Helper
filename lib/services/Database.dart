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
          final data = snapshot.data();
          albums.add(
              Album(
                label: 'Label',
                url: 'https://firebasestorage.googleapis.com/v0/b/autismhelperdatabase.appspot.com/o/Person.png?alt=media&token=7e39bde4-fda0-4594-9cf0-2f5d496190e9',
                albumColor: int.parse('0xFFE4E4E4'),
              )
          );
        }
      }
    });

    snapshots.map((snapshot) {
      snapshot.docs.map(
            (snapshot) {
          final data = snapshot.data();
          albums.add(  Album(
            label: data['Label'],
            url: 'https://firebasestorage.googleapis.com/v0/b/autismhelperdatabase.appspot.com/o/Drink.png?alt=media&token=23e1fae2-72c8-4cbf-aeaa-e61383c55762',
            albumColor: int.parse(data['Color']),
          ));
        },
      );
    });

    return albums;


  }
}
