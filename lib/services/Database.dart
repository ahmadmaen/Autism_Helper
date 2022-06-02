import  'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Database {

  Future<void> createJob(Map<String, dynamic> jobData);
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
  Future<void> createJob(Map<String, dynamic> jobData) async {
    final path = '/users/$uid/jobs/job_abc';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(jobData);

  }


}