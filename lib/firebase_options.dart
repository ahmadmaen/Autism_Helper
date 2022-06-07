
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqwuXHA_e6JjC-JdaT5XAVaURL9fHwmJ8',
    appId: '1:947247240474:android:9f0d3b58e41e1f550cc8a3',
    messagingSenderId: '947247240474',
    projectId: 'autismhelperdatabase',
    storageBucket: 'autismhelperdatabase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5LLbkPOafu03DZkM3JES6KjzHUUn9M1Y',
    appId: '1:947247240474:ios:b649657022ac09fc0cc8a3',
    messagingSenderId: '947247240474',
    projectId: 'autismhelperdatabase',
    storageBucket: 'autismhelperdatabase.appspot.com',
    androidClientId: '947247240474-ssqmf6nkof74n3238sjba31en1rbcv8h.apps.googleusercontent.com',
    iosClientId: '947247240474-7ba1u6vut57a4pn1rqdtkrs89g2mh5gs.apps.googleusercontent.com',
    iosBundleId: 'com.square.autismhelperproject.autismHelperProject',
  );
}
