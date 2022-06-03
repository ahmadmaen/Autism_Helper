import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String pictureUrl;
  final double pictureSize;
  final double pictureRadius;

  const ProfilePicture({
    Key? key,
    required this.pictureUrl,
    required this.pictureSize,
    required this.pictureRadius,
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
      borderRadius: BorderRadius.circular(pictureRadius),
    );
  }
}
