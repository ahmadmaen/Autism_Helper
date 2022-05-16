import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String pictureUrl;
  final double pictureSize;

  const ProfilePicture({
    Key? key,
    required this.pictureUrl,
    required this.pictureSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.network(
        pictureUrl,
        width: pictureSize,
        height: pictureSize,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(pictureSize * 2),
    );
  }
}
