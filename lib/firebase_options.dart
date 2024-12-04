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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyDxRhgrkbD6ECS-2b3msmSbboSWtdUM8dM',
    appId: '1:6676696388:web:026656161935dbedf4db11',
    messagingSenderId: '6676696388',
    projectId: 'mahallaty0',
    authDomain: 'mahallaty0.firebaseapp.com',
    storageBucket: 'mahallaty0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxwVisYyFVRaD1c3LTu3hly_v4QwZV2mM',
    appId: '1:6676696388:android:7434fb98f62383bdf4db11',
    messagingSenderId: '6676696388',
    projectId: 'mahallaty0',
    storageBucket: 'mahallaty0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAElIqOQ21wC_-_E-il4Wb-KshnboQ8WYo',
    appId: '1:6676696388:ios:8c79ae3be6bcb2e1f4db11',
    messagingSenderId: '6676696388',
    projectId: 'mahallaty0',
    storageBucket: 'mahallaty0.firebasestorage.app',
    iosBundleId: 'com.example.mahallaty',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAElIqOQ21wC_-_E-il4Wb-KshnboQ8WYo',
    appId: '1:6676696388:ios:8c79ae3be6bcb2e1f4db11',
    messagingSenderId: '6676696388',
    projectId: 'mahallaty0',
    storageBucket: 'mahallaty0.firebasestorage.app',
    iosBundleId: 'com.example.mahallaty',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDxRhgrkbD6ECS-2b3msmSbboSWtdUM8dM',
    appId: '1:6676696388:web:a4c02634e6e48d3af4db11',
    messagingSenderId: '6676696388',
    projectId: 'mahallaty0',
    authDomain: 'mahallaty0.firebaseapp.com',
    storageBucket: 'mahallaty0.firebasestorage.app',
  );

}