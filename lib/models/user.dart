import 'package:autism_helper_project/models/picture.dart';

class User1 {
  final int userId=111;
  final String name;
  final String userEmail='suii';
  final String userPassword='suii';
  final String userProfilePictureUrl;
  final List<Picture> pictures;

  User1({
    required this.name,
    required this.userProfilePictureUrl,
    this.pictures = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'ProfilePictureURL': userProfilePictureUrl,
    };
  }
}
