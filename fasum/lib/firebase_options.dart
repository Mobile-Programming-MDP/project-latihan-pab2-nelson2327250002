// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCKMXaP50MAUVFC-BlI6ReO7PbgaTYkXHA',
    appId: '1:966308943859:web:88b5517f8738c07a602486',
    messagingSenderId: '966308943859',
    projectId: 'fasum-apps-d3450',
    authDomain: 'fasum-apps-d3450.firebaseapp.com',
    databaseURL: 'https://fasum-apps-d3450-default-rtdb.firebaseio.com',
    storageBucket: 'fasum-apps-d3450.firebasestorage.app',
    measurementId: 'G-43XKX9E92W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiI9UPIHv4fhr9fhjEZK9bgB3xCuuHIGM',
    appId: '1:966308943859:android:aa843fb099450ed7602486',
    messagingSenderId: '966308943859',
    projectId: 'fasum-apps-d3450',
    databaseURL: 'https://fasum-apps-d3450-default-rtdb.firebaseio.com',
    storageBucket: 'fasum-apps-d3450.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKMXaP50MAUVFC-BlI6ReO7PbgaTYkXHA',
    appId: '1:966308943859:web:b17916e2f8778452602486',
    messagingSenderId: '966308943859',
    projectId: 'fasum-apps-d3450',
    authDomain: 'fasum-apps-d3450.firebaseapp.com',
    databaseURL: 'https://fasum-apps-d3450-default-rtdb.firebaseio.com',
    storageBucket: 'fasum-apps-d3450.firebasestorage.app',
    measurementId: 'G-3YZ3RZB590',
  );

}