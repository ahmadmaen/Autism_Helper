

import '../models/picture.dart';

class Translator {
  int firstAlbumId = -1;
  int secondAlbumId = -1;
  String sentence = "";


  void addPicture(Picture picture) {
    if(firstAlbumId == -1 && secondAlbumId == -1)
      {
        addFirstPicture(picture);
      }
    else if(firstAlbumId != -1 && secondAlbumId == -1)
      {
        addSecondPicture(picture);
      }
  }


  void addFirstPicture(Picture picture) {
    firstAlbumId = int.parse(picture.albumID);
    if(int.parse(picture.albumID) == 0)
      {
        sentence = "I want to see ${picture.pictureLabel}";
      }
    else if(int.parse(picture.albumID) == 1)
    {
      sentence = "I feel ${picture.pictureLabel}";
    }
    else if(int.parse(picture.albumID) == 2)
    {
      sentence = "I want to go ${picture.pictureLabel}";
    }
    else if(int.parse(picture.albumID) == 3)
    {
      sentence = "I want to play ${picture.pictureLabel}";
    }
    else if(int.parse(picture.albumID) == 4)
    {
      sentence = "I want to drink ${picture.pictureLabel}";
    }
    else if(int.parse(picture.albumID) == 5)
    {
      sentence = "I want to eat ${picture.pictureLabel}";
    }
  }

  void addSecondPicture(Picture picture) {
    firstAlbumId = int.parse(picture.albumID);
    if(int.parse(picture.albumID) == 0)
    {
      sentence = "I want to see ${picture.pictureLabel}";
    }
    else if(int.parse(picture.albumID) == 1)
    {
      sentence = "I feel ${picture.pictureLabel}";
    }
    else if(int.parse(picture.albumID) == 2)
    {
      sentence = "I want to go ${picture.pictureLabel}";
    }
    else if(int.parse(picture.albumID) == 3)
    {
      sentence = "I want to play ${picture.pictureLabel}";
    }
    else if(int.parse(picture.albumID) == 4)
    {
      sentence = "I want to drink ${picture.pictureLabel}";
    }
    else if(int.parse(picture.albumID) == 5)
    {
      sentence = "I want to eat ${picture.pictureLabel}";
    }
  }




}