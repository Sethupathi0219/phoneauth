// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBf07096QefrIxDMdYDOBUAI9gIQ_X_RxE',
    appId: '1:127202765831:web:bd37dab281d712ee048ea2',
    messagingSenderId: '127202765831',
    projectId: 'fir-project-75444',
    authDomain: 'fir-project-75444.firebaseapp.com',
    storageBucket: 'fir-project-75444.appspot.com',
    measurementId: 'G-8GP715EJ5X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDslC9sHhwbLzc5W7G1ZUSR72JTtGUHqec',
    appId: '1:127202765831:android:b577b2dbd4246d8b048ea2',
    messagingSenderId: '127202765831',
    projectId: 'fir-project-75444',
    storageBucket: 'fir-project-75444.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBf3zrTpKKUFpS5ezrBrUuzG_DGNDLSNPg',
    appId: '1:127202765831:ios:e7471a145863cba5048ea2',
    messagingSenderId: '127202765831',
    projectId: 'fir-project-75444',
    storageBucket: 'fir-project-75444.appspot.com',
    iosClientId: '127202765831-kmv3hdv2rk3vtf6d9salr73do08325sq.apps.googleusercontent.com',
    iosBundleId: 'com.example.phoneauth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBf3zrTpKKUFpS5ezrBrUuzG_DGNDLSNPg',
    appId: '1:127202765831:ios:8c46eb33c9926c3a048ea2',
    messagingSenderId: '127202765831',
    projectId: 'fir-project-75444',
    storageBucket: 'fir-project-75444.appspot.com',
    iosClientId: '127202765831-acgpvqv875s6n1bkg5lfr2hultrf6v74.apps.googleusercontent.com',
    iosBundleId: 'com.example.phoneauth.RunnerTests',
  );
}
