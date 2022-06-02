import  'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autism_helper_project/models/user.dart';

import 'api_path.dart';
import 'firestore_service.dart';

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
  final _service = FirestoreService.instance;

  @override
  Future<void> setUserData(User1 user) async => _service.setData(
      path: APIPath.user(uid),
      data: user.toMap(),
  );


}