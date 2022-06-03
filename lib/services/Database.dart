import 'dart:core';

import 'package:autism_helper_project/models/album.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {

  Future<void> setUserData(User1 user);

  Stream<List<Album>> readAlbums();

  User1 getUser();

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
  }

  @override
  Stream<List<Album>> readAlbums() => _service.collectionStream
    (
      path:  APIPath.albums(),
      builder: (data) => Album.fromMap(data));

}
