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
    apiKey: 'AIzaSyBpybrl02HcN6FwaaKkZlqqPnLRYicqWos',
    appId: '1:909365571025:web:ffeb763b6d5b87d88144f0',
    messagingSenderId: '909365571025',
    projectId: 'budget-app-lsm',
    authDomain: 'budget-app-lsm.firebaseapp.com',
    storageBucket: 'budget-app-lsm.appspot.com',
    measurementId: 'G-THEPG95BDT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARIOgPwvC2UwgZyUuW3FQ_zwzHMvBvKrg',
    appId: '1:909365571025:android:4407675cf44ccc8d8144f0',
    messagingSenderId: '909365571025',
    projectId: 'budget-app-lsm',
    storageBucket: 'budget-app-lsm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIFhNE1MHY25aBntwOhPRzgGhbgIRKSDA',
    appId: '1:909365571025:ios:f73f1de0bb3586f88144f0',
    messagingSenderId: '909365571025',
    projectId: 'budget-app-lsm',
    storageBucket: 'budget-app-lsm.appspot.com',
    iosClientId: '909365571025-bo7sq85ml1l352lhkcnqhqggddal7lvs.apps.googleusercontent.com',
    iosBundleId: 'com.example.budgetApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIFhNE1MHY25aBntwOhPRzgGhbgIRKSDA',
    appId: '1:909365571025:ios:f73f1de0bb3586f88144f0',
    messagingSenderId: '909365571025',
    projectId: 'budget-app-lsm',
    storageBucket: 'budget-app-lsm.appspot.com',
    iosClientId: '909365571025-bo7sq85ml1l352lhkcnqhqggddal7lvs.apps.googleusercontent.com',
    iosBundleId: 'com.example.budgetApp',
  );
}
