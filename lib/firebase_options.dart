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
    apiKey: 'AIzaSyDqtUmXCYsJpr5C5MI0j9gEUHUWTWczhoo',
    appId: '1:919819755458:web:408202852967427860c05b',
    messagingSenderId: '919819755458',
    projectId: 'chat-app-161b3',
    authDomain: 'chat-app-161b3.firebaseapp.com',
    storageBucket: 'chat-app-161b3.appspot.com',
    measurementId: 'G-D9BQE7Y3KP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5yCz4b1SWOcFULYzywGcxkOfVUOJwwXw',
    appId: '1:919819755458:android:3bc1dc923e219bd360c05b',
    messagingSenderId: '919819755458',
    projectId: 'chat-app-161b3',
    storageBucket: 'chat-app-161b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBa1lpTE_FdNx2K976nmr0rWgzMTkspWoY',
    appId: '1:919819755458:ios:0831ec1f8b8735d160c05b',
    messagingSenderId: '919819755458',
    projectId: 'chat-app-161b3',
    storageBucket: 'chat-app-161b3.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBa1lpTE_FdNx2K976nmr0rWgzMTkspWoY',
    appId: '1:919819755458:ios:e2ee885e7567f91460c05b',
    messagingSenderId: '919819755458',
    projectId: 'chat-app-161b3',
    storageBucket: 'chat-app-161b3.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}