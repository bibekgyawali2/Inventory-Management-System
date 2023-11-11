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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAWLQIrryePjrRxJvPeRhksMpxFtr5sJdk',
    appId: '1:610320478328:web:c8ff72511321835de27d8d',
    messagingSenderId: '610320478328',
    projectId: 'inventory-d11d3',
    authDomain: 'inventory-d11d3.firebaseapp.com',
    storageBucket: 'inventory-d11d3.appspot.com',
    measurementId: 'G-6RYM2RXCG2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLzpJfx8pu3Cwc-u1po6al1LXY7GP-TVQ',
    appId: '1:610320478328:android:fdc6314765f27f6ce27d8d',
    messagingSenderId: '610320478328',
    projectId: 'inventory-d11d3',
    storageBucket: 'inventory-d11d3.appspot.com',
  );
}
