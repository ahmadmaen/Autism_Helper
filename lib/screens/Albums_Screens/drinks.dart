// ignore_for_file: prefer_const_constructors

import 'package:autism_helper_project/database.dart';
import 'package:flutter/material.dart';

class Drinks extends StatelessWidget {
  const Drinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:_buildContent(),
        ),
      )),
    );

  }

  Widget _buildContent() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                child: Image.network(
                  pictures[index].pictureUrl,
                  width: 400,
                  height:120,
                ),
              ), //(Picture)
            ],
          );
        });
  }
}