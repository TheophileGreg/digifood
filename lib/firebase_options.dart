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
    apiKey: 'AIzaSyAzpqKgwRmy9Jv91NOMmYCBNT70u0AWG7w',
    appId: '1:623131926292:web:e785f56b155bdea5242c01',
    messagingSenderId: '623131926292',
    projectId: 'digifood-c48eb',
    authDomain: 'digifood-c48eb.firebaseapp.com',
    storageBucket: 'digifood-c48eb.appspot.com',
    measurementId: 'G-4FK3J23XGV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBynjlul4dyyxfS-u15woQ4KRETUMUlycU',
    appId: '1:623131926292:android:0a92e1a3480cb11d242c01',
    messagingSenderId: '623131926292',
    projectId: 'digifood-c48eb',
    storageBucket: 'digifood-c48eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1bOS4qWQjI66GDbWNjXQuMmq-qx8RBZo',
    appId: '1:623131926292:ios:1241aad71a6311c7242c01',
    messagingSenderId: '623131926292',
    projectId: 'digifood-c48eb',
    storageBucket: 'digifood-c48eb.appspot.com',
    iosClientId: '623131926292-vgghddfkdmlg71leruhn59i4tnc094sa.apps.googleusercontent.com',
    iosBundleId: 'com.example.digifood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1bOS4qWQjI66GDbWNjXQuMmq-qx8RBZo',
    appId: '1:623131926292:ios:1241aad71a6311c7242c01',
    messagingSenderId: '623131926292',
    projectId: 'digifood-c48eb',
    storageBucket: 'digifood-c48eb.appspot.com',
    iosClientId: '623131926292-vgghddfkdmlg71leruhn59i4tnc094sa.apps.googleusercontent.com',
    iosBundleId: 'com.example.digifood',
  );
}