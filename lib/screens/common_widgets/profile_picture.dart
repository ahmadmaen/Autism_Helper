
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final Image picture;
  final double pictureSize;
  final double pictureRadius;

  const ProfilePicture({
    Key? key,
    required this.picture,
    required this.pictureSize,
    required this.pictureRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image(
        image: picture.image,
        width: pictureSize,
        height: pictureSize,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(pictureRadius),
    );
  }
}
