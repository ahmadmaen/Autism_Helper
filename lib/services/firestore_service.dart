import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

import '../models/user.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> setData({ required String path, required Map<String, dynamic> data, }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('$path: $data');
    }
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('delete: $path');
    }
    await reference.delete();
  }

  Stream<List<T>> collectionStream<T>({ required String path,  required T Function(Map<String, dynamic> data) builder,}) {

    final query = FirebaseFirestore.instance.collection(path);

    final snapshots = query.snapshots();

    return snapshots.map((snapshot) =>
      snapshot.docs.map((snapshot) => builder(snapshot.data())).toList(),
    );
  }

  User1 getUser({required String path, required String documentID })  {

    User1 user=User1();
    DatabaseReference userName = FirebaseDatabase.instance.ref('User/documentID/Name');
    userName.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      user.name = data as String;
    });

    DatabaseReference userProfilePictureURL = FirebaseDatabase.instance.ref('User/documentID/ProfilePictureURL');
    userProfilePictureURL.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      user.userProfilePictureUrl = data as String;
    });

    return user;
  }

}
