import 'dart:core';

import 'package:autism_helper_project/models/album.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autism_helper_project/models/user.dart';
import 'package:flutter/foundation.dart';

import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setUserData(User1 user);
  Future readAlbums();

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
  Future<List<Album>> readAlbums() async {
    final path = APIPath.album();
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();

    QuerySnapshot querySnapshot = await reference.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();


    List<Album> albums=[];

    for(int i=0;i<allData.length;i++)
      {
         albums.add(
             Album(
                label: '',
                albumColor: 1,
                url: ''
            )
        );
      }

    /*snapshots.listen((snapshot) {
      for (var snapshot in snapshot.docs) {
        if (kDebugMode) {  print( snapshot.data() );  }
      }
    }
    );

    snapshots.map((snapshot) {
      snapshot.docs.map( (snapshot) {
          final data = snapshot.data();
          albums.add(  Album(
            label: data['Label'],
            url: 'https://firebasestorage.googleapis.com/v0/b/autismhelperdatabase.appspot.com/o/Drink.png?alt=media&token=23e1fae2-72c8-4cbf-aeaa-e61383c55762',
            albumColor: int.parse(data['Color']),
          ));
          print( snapshot.data());
        },
      );
    });*/

    print(albums);

    return albums;


  }
}
