import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

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
    print('delete: $path');
    await reference.delete();
  }

  Stream<List<T>> collectionStream<T>({ required String path,  required T Function(Map<String, dynamic> data) builder,}) {

    final query = FirebaseFirestore.instance.collection(path);

    final snapshots = query.snapshots();

    return snapshots.map((snapshot) =>
      snapshot.docs.map((snapshot) => builder(snapshot.data())).toList(),
    );
  }

  Stream<T> documentStream<T>({required String path ,  required T Function(Map<String, dynamic> data , String documentID) builder})  {

    final reference = FirebaseFirestore.instance.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data()!, snapshot.id));
  }

}
