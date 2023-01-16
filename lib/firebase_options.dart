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
    apiKey: 'AIzaSyD2hRFyLBUzWqBKE0qOk4eCOlPDBgH1deY',
    appId: '1:1069585464306:web:6ef1101837e7098806c96b',
    messagingSenderId: '1069585464306',
    projectId: 'flutter-project-3e87d',
    authDomain: 'flutter-project-3e87d.firebaseapp.com',
    storageBucket: 'flutter-project-3e87d.appspot.com',
    measurementId: 'G-GN1XKV8MBD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQ-F2XK8JfQL0XpF16w7IEEwwk_yY0yvA',
    appId: '1:1069585464306:android:7eabdc7d0147d0cb06c96b',
    messagingSenderId: '1069585464306',
    projectId: 'flutter-project-3e87d',
    storageBucket: 'flutter-project-3e87d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBH3yjLAiDwJ6pvtc9H4KamcvmE4JLucAM',
    appId: '1:1069585464306:ios:851d11bfdbb3af6306c96b',
    messagingSenderId: '1069585464306',
    projectId: 'flutter-project-3e87d',
    storageBucket: 'flutter-project-3e87d.appspot.com',
    iosClientId: '1069585464306-30r0fob86qmu2s7o5jhlubceuq40s4i5.apps.googleusercontent.com',
    iosBundleId: 'com.finalproject.finalproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBH3yjLAiDwJ6pvtc9H4KamcvmE4JLucAM',
    appId: '1:1069585464306:ios:851d11bfdbb3af6306c96b',
    messagingSenderId: '1069585464306',
    projectId: 'flutter-project-3e87d',
    storageBucket: 'flutter-project-3e87d.appspot.com',
    iosClientId: '1069585464306-30r0fob86qmu2s7o5jhlubceuq40s4i5.apps.googleusercontent.com',
    iosBundleId: 'com.finalproject.finalproject',
  );
}
