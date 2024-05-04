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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfQplMyBNeU_WfKpBM4rD8FrzJuzwCFqQ',
    appId: '1:766234130685:android:b71b0944f603130e0aa694',
    messagingSenderId: '766234130685',
    projectId: 'gestionnaireinterventions',
    storageBucket: 'gestionnaireinterventions.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmrqdAg6dFkWc71L1HURHene-6aHrTOpo',
    appId: '1:766234130685:ios:94106b6c2b0522910aa694',
    messagingSenderId: '766234130685',
    projectId: 'gestionnaireinterventions',
    storageBucket: 'gestionnaireinterventions.appspot.com',
    iosBundleId: 'com.example.gestionnaireInterventions',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBn1afiZfhbLN9j6OJyBnfMrAXvy0acgIs',
    appId: '1:766234130685:web:35925c5a6cb6b3ea0aa694',
    messagingSenderId: '766234130685',
    projectId: 'gestionnaireinterventions',
    authDomain: 'gestionnaireinterventions.firebaseapp.com',
    storageBucket: 'gestionnaireinterventions.appspot.com',
    measurementId: 'G-N0MVZ1GBDK',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmrqdAg6dFkWc71L1HURHene-6aHrTOpo',
    appId: '1:766234130685:ios:94106b6c2b0522910aa694',
    messagingSenderId: '766234130685',
    projectId: 'gestionnaireinterventions',
    storageBucket: 'gestionnaireinterventions.appspot.com',
    iosBundleId: 'com.example.gestionnaireInterventions',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBn1afiZfhbLN9j6OJyBnfMrAXvy0acgIs',
    appId: '1:766234130685:web:618246c8ee158dfd0aa694',
    messagingSenderId: '766234130685',
    projectId: 'gestionnaireinterventions',
    authDomain: 'gestionnaireinterventions.firebaseapp.com',
    storageBucket: 'gestionnaireinterventions.appspot.com',
    measurementId: 'G-MFK57V8VKV',
  );

}