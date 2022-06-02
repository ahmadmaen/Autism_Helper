import  'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autism_helper_project/models/user.dart';

abstract class Database {

  Future<void> setUserData(User1 user);
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

  @override
  Future<void> setUserData(User1 user) async {
    final path = '/User/$uid';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(user.toMap());

  }


}