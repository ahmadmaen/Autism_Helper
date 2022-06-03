// ignore_for_file: prefer_const_constructors
import 'package:autism_helper_project/screens/Home/about_us_page.dart';
import 'package:autism_helper_project/screens/albums_screens/persons.dart';
import 'package:autism_helper_project/screens/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:autism_helper_project/screens/Albums_Screens/drinks.dart';
import 'package:autism_helper_project/screens/Albums_Screens/feelings.dart';
import 'package:autism_helper_project/screens/Albums_Screens/foods.dart';
import 'package:autism_helper_project/screens/Albums_Screens/games.dart';
import 'package:autism_helper_project/screens/Albums_Screens/places.dart';
import '../../Services/auth.dart';
import '../../models/album.dart';
import '../../services/database.dart';
import '../common_widgets/profile_picture.dart';
import 'package:autism_helper_project/models/user.dart';
import '../common_widgets/show_alert_dialog.dart';
import 'contact_us_page.dart';

class HomePage extends StatefulWidget {
  const HomePage( {Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _icon = Icons.toggle_off_outlined;

  late User1 user;

  List<Album> albums = <Album>[];

  Future<void> getData()  async {
    final Database database = Provider.of<Database>(context, listen: false,);
    var albums1 =  await database.readAlbums().first;
    User1 user1;
    try{
      user1 =   database.getUser();
    }
    catch(e){
      user1 = User1(
          name: 'User',
          userProfilePictureUrl: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
      );
    }
    setState(() {
      albums = albums1;
      user = user1;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Database database = Provider.of<Database>(context, listen: false,);
    user = database.getUser();
    print(user.name);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('images/title.png', scale: 18)),
        leading: menu(context),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true, builder: (_) =>  ProfilePage(user:user,))),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 12, bottom: 12, right: 5, left: 5),
              child: ProfilePicture(
                pictureUrl: user.userProfilePictureUrl,
                pictureSize: 30,
              ),
            ),
          ), //(ProfilePicture)
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 2,
          ),
          itemCount: albums.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) => getScreen(index))),
                  child: Card(
                    color: Color( albums[index].albumColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        albums[index].url,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ), //(Picture)
              ],
            );
          }),
    );
  }

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return Persons();
      case 1:
        return Feelings();
      case 2:
        return Places();
      case 3:
        return Games();
      case 4:
        return Drinks();
      case 5:
        return Foods();
      default:
        return Places();
    }
  }

  Future<void> _setUserData(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
    } on FirebaseAuthException catch (e) {
      showAlertDialog(
        context,
        content: e.message,
        title: "failed",
        cancelActionText: "",
        defaultActionText: "OK",
      );
    }
  }

  PopupMenuButton menu(BuildContext context) {
    return PopupMenuButton(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 4.0,
        ),
        elevation: 20,
        offset: Offset(0, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("About Us"),
                value: 0,
              ),
              PopupMenuItem(
                child: Text("Contact Us"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Sign Out"),
                value: 2,
              )
            ],
        onSelected: (result) {
          if (result == 0) {
            Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true, builder: (context) => AboutUsPage(user:user,)));
          } else if (result == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true, builder: (context) => ContactUsPage(user:user,)));
          } else if (result == 2) {
            _confirmSignOut();
          }
        });
  }

  Future<void> _confirmSignOut() async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut();
    }
  }

  Future<void> _signOut() async {
    final AuthBase? auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth?.signOut();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          if (kDebugMode) {
            print("Anonymous auth hasn't been enabled for this project.");
          }
          break;
        default:
          if (kDebugMode) {
            print("Unknown error.");
          }
      }
    }
  }

  IconButton buildDarkModeButton() {
    return IconButton(
      icon: Icon(
        _icon,
        color: Colors.black,
        size: 50,
      ),
      onPressed: () {
        setState(() {
          if (_icon == Icons.toggle_off_outlined) {
            _icon = Icons.toggle_on_outlined;
            //themeChange.darkTheme = true;
          } else {
            _icon = Icons.toggle_off_outlined;
            //themeChange.darkTheme = false;
          }
        });
      },
    );
  }
}
