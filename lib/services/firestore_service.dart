import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> setData({ required String path, required Map<String, dynamic> data, }) async {
    CollectionReference database = FirebaseFirestore.instance.collection(path);
    if (kDebugMode) {
      print('$path: $data');
    }
    database.add(data).then((value) => print(value)).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('delete: $path');
    }
    await reference.delete();
  }

  Stream<dynamic> collectionStream({ required String path}) {
    Stream collectionStream = FirebaseFirestore.instance.collection(path).snapshots();
    return collectionStream;
  }

  DocumentReference<Map<String, dynamic>> getDoc({required String path, required String documentID })  {
    DocumentReference<Map<String, dynamic>> collectionStream = FirebaseFirestore.instance.collection(path).doc(documentID);
    return collectionStream;

  }

  Stream<dynamic> getDocStream({required String path, required String documentID })  {
    Stream collectionStream = FirebaseFirestore.instance.collection(path).doc(documentID).snapshots();
    return collectionStream;

  }

}
