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
    apiKey: 'AIzaSyDCUhzt4ts0GTMzfNglGJvIoOrkHNWPLjg',
    appId: '1:114772763250:web:894f8135433292870d18eb',
    messagingSenderId: '114772763250',
    projectId: 'contactapp60',
    authDomain: 'contactapp60.firebaseapp.com',
    storageBucket: 'contactapp60.appspot.com',
    measurementId: 'G-D8M1JX0LVP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEng1aB4dE28GuTj8hS4N0dICCncnMVRE',
    appId: '1:114772763250:android:911ac9b3205b18af0d18eb',
    messagingSenderId: '114772763250',
    projectId: 'contactapp60',
    storageBucket: 'contactapp60.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZ2JDmF9p4q5M8Gd3b-ixH6mTtoFLIQSo',
    appId: '1:114772763250:ios:8e4a8cca60cc45fd0d18eb',
    messagingSenderId: '114772763250',
    projectId: 'contactapp60',
    storageBucket: 'contactapp60.appspot.com',
    iosBundleId: 'com.example.contactApp60',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZ2JDmF9p4q5M8Gd3b-ixH6mTtoFLIQSo',
    appId: '1:114772763250:ios:3e974a44e61a8c6d0d18eb',
    messagingSenderId: '114772763250',
    projectId: 'contactapp60',
    storageBucket: 'contactapp60.appspot.com',
    iosBundleId: 'com.example.contactApp60.RunnerTests',
  );
}
