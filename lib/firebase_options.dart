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
    apiKey: 'AIzaSyCz6fDVYwHJ9jxQJo2MA46X13eCrda-z9c',
    appId: '1:153254935810:web:eefa2babe70b05a237961b',
    messagingSenderId: '153254935810',
    projectId: 'onco-app-e14d1',
    authDomain: 'onco-app-e14d1.firebaseapp.com',
    storageBucket: 'onco-app-e14d1.appspot.com',
    measurementId: 'G-QMCFYDTMQJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6y9T6j1UnnEZEhMuAZapeDm3gaKZXo5I',
    appId: '1:153254935810:android:4320933f45dd36c237961b',
    messagingSenderId: '153254935810',
    projectId: 'onco-app-e14d1',
    storageBucket: 'onco-app-e14d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCxy5hKL7Wq88smNq_TBGQejz8TY_pmn0',
    appId: '1:153254935810:ios:d39e05daff8bac7637961b',
    messagingSenderId: '153254935810',
    projectId: 'onco-app-e14d1',
    storageBucket: 'onco-app-e14d1.appspot.com',
    iosClientId: '153254935810-kaf52p2bcmmutm7pmmhnt5bb43nsaga8.apps.googleusercontent.com',
    iosBundleId: 'com.example.oncoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCxy5hKL7Wq88smNq_TBGQejz8TY_pmn0',
    appId: '1:153254935810:ios:5962fbb9779ebb7d37961b',
    messagingSenderId: '153254935810',
    projectId: 'onco-app-e14d1',
    storageBucket: 'onco-app-e14d1.appspot.com',
    iosClientId: '153254935810-46d2guo1g6rtuclfhv2ujd7ovi74i6d5.apps.googleusercontent.com',
    iosBundleId: 'com.example.oncoApp.RunnerTests',
  );
}
