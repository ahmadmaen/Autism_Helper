import 'package:autism_helper_project/models/picture.dart';

class User1 {
   int userId=111;
   String name;
   String userEmail='suii';
   String userPassword='suii';
   String userProfilePictureUrl;
   List<Picture> pictures;

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

  factory User1.fromMap(Map<String,dynamic> data , String id) {
    return User1(
        name: data['Name'],
        userProfilePictureUrl: data['ProfilePictureURL'],
    );
  }

}
