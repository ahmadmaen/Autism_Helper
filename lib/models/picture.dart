

import 'package:cloud_firestore/cloud_firestore.dart';

class Picture {
  final String id;
  final String pictureLabel;
  final String pictureUrl;
  final String albumID;
  final String userID;


  const Picture({
    required this.id,
    required this.pictureLabel,
    required this.pictureUrl,
    required this.albumID,
    required this.userID,
  });



  factory Picture.fromMap( Map<String,dynamic> data) {
    return Picture(
        id: data['ID'],
        pictureLabel: data['Label'],
        pictureUrl: data['URL'],
        albumID: data['AlbumID'],
        userID: data['UserID']
    );
  }



}
