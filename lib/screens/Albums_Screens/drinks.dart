// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Drinks extends StatelessWidget {
  const Drinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Drinks'),
        ),
      )),
    );

  }


}