

import '../models/picture.dart';

class Translator {
  int firstAlbumId = -1;
  int secondAlbumId =  -1;

  late Picture firstPicture ;
  late Picture secondPicture ;

  String sentence = "";


  void addPicture(Picture picture) {

    if(firstAlbumId == -1 && secondAlbumId == -1) {
        firstAlbumId = int.parse(picture.albumID);
        firstPicture = picture;
        addFirstPicture(picture);

      }

    else if(firstAlbumId != -1 && secondAlbumId == -1) {
        secondAlbumId = int.parse(picture.albumID);
        secondPicture = picture;
        addSecondPicture(picture);
      }

    else if(firstAlbumId != -1 && secondAlbumId != -1) {
      firstAlbumId = int.parse(picture.albumID);
      firstPicture = picture;
      secondAlbumId = -1;
      addFirstPicture(picture);
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
    if(firstAlbumId == 0)
    {
      ifTheFirstAlbumIs0();
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

  void ifTheFirstAlbumIs0()
  {
    if(secondAlbumId == 0)
    {
      sentence = "${firstPicture.pictureLabel} want to see ${secondPicture.pictureLabel}";
    }
    else if(secondAlbumId == 1)
    {
      sentence = "${firstPicture.pictureLabel} feel ${secondPicture.pictureLabel}";
    }
    else if(secondAlbumId == 2)
    {
      sentence = "i want to go ${secondPicture.pictureLabel} with ${firstPicture.pictureLabel}";
    }
    else if(secondAlbumId == 3)
    {
      sentence = "i want to play ${secondPicture.pictureLabel} with ${firstPicture.pictureLabel}";
    }
    else if(secondAlbumId == 4)
    {
      sentence = "i want to drink ${secondPicture.pictureLabel} with ${firstPicture.pictureLabel}";
    }
    else if(secondAlbumId == 5)
    {
      sentence = "i want to eat ${secondPicture.pictureLabel} with ${firstPicture.pictureLabel}";
    }
  }




}