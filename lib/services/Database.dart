import 'dart:core';

import 'package:autism_helper_project/models/album.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setUserData(User1 user);

  Stream<dynamic> readAlbums();

  FutureBuilder<DocumentSnapshot> getUser();
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

  /*@override
  User1 getUser()  {
    User1 user=User1();
    DatabaseReference userName = FirebaseDatabase.instance.ref('/User/TBdjYjLCSJarf7KTjJQWrcfgkOf2/Name');
    userName.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      user.name = data as String;
      print(data);
    });
    print('s1');
    DatabaseReference userProfilePictureURL = FirebaseDatabase.instance.ref('/User/TBdjYjLCSJarf7KTjJQWrcfgkOf2/ProfilePictureURL');
    userProfilePictureURL.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      user.userProfilePictureUrl = data as String;
    });
    print('s2');
    return user;
  }*/

  @override
  Stream<dynamic> readAlbums() => _service.collectionStream(
        path: APIPath.albums(),
      );

  @override
  FutureBuilder<DocumentSnapshot> getUser() {
    CollectionReference users = FirebaseFirestore.instance.collection('/User');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          print("loading");
          if (snapshot.hasError) {
            print("Something went wrong");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            print("Document does not exist");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            print("Full Name: ${data['full_name']} ${data['last_name']}");
          }
          print("loading");
          return const Text("loading");
        });
  }
}
