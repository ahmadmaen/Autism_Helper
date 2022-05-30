// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Persons extends StatelessWidget {
  const Persons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Persons'),
        ),
      )),
    );
  }
}
