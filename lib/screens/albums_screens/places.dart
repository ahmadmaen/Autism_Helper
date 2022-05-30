// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Places extends StatelessWidget {
  const Places({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Places'),
        ),
      )),
    );

  }


}