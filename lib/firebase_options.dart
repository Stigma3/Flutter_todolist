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
    apiKey: 'AIzaSyBfm7MLqo8UXR-0ylZQNohKvO9XZYT9GPc',
    appId: '1:93207674172:web:6f4bccb7f8d4c0801ff239',
    messagingSenderId: '93207674172',
    projectId: 'flutter-todolist-5636e',
    authDomain: 'flutter-todolist-5636e.firebaseapp.com',
    storageBucket: 'flutter-todolist-5636e.appspot.com',
    measurementId: 'G-M1GQ67J1C4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrB699yAdpWvHK725y3SnHLKsdY0TAFeY',
    appId: '1:93207674172:android:15a091723ce419e41ff239',
    messagingSenderId: '93207674172',
    projectId: 'flutter-todolist-5636e',
    storageBucket: 'flutter-todolist-5636e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCveCeDMYp1G1icY_5A1eypQkgeD9iN5YM',
    appId: '1:93207674172:ios:139e5da38f3337391ff239',
    messagingSenderId: '93207674172',
    projectId: 'flutter-todolist-5636e',
    storageBucket: 'flutter-todolist-5636e.appspot.com',
    iosClientId: '93207674172-e31h5ve19gtcv17ukf36n0rm9b0akk8i.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCveCeDMYp1G1icY_5A1eypQkgeD9iN5YM',
    appId: '1:93207674172:ios:139e5da38f3337391ff239',
    messagingSenderId: '93207674172',
    projectId: 'flutter-todolist-5636e',
    storageBucket: 'flutter-todolist-5636e.appspot.com',
    iosClientId: '93207674172-e31h5ve19gtcv17ukf36n0rm9b0akk8i.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );
}