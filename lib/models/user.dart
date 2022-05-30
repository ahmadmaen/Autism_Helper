import 'package:autism_helper_project/models/picture.dart';

class User {
  final String userName;
  final int userId;
  final String userEmail;
  final String userPassword;
  final String userProfilePictureUrl;
  //final Role userRole;
  final List<Picture> pictures;

  const User({
    required this.userName,
    required this.userId,
    required this.userEmail,
    required this.userPassword,
    //this.userRole,
    this.userProfilePictureUrl = 'images/defaultProfile.png',
    this.pictures = const [],
  });
}
