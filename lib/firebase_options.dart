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
    apiKey: 'AIzaSyARfKypHG4_06ky9SQ9VrOFofWeB8n1JVI',
    appId: '1:852731056284:web:8948293a3fa8d5728a9d59',
    messagingSenderId: '852731056284',
    projectId: 'cloud-kitchen-2e927',
    authDomain: 'cloud-kitchen-2e927.firebaseapp.com',
    storageBucket: 'cloud-kitchen-2e927.firebasestorage.app',
    measurementId: 'G-T9ZK9M9S7K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB28s_E2bazKsX-bT_oxA5zUrHuBOa9Gk0',
    appId: '1:852731056284:android:5587e43cdeff3a328a9d59',
    messagingSenderId: '852731056284',
    projectId: 'cloud-kitchen-2e927',
    storageBucket: 'cloud-kitchen-2e927.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-QRXzMQRjCNSBhkyqoPNcVzMkU5F118Y',
    appId: '1:852731056284:ios:c62243f1ccb0120a8a9d59',
    messagingSenderId: '852731056284',
    projectId: 'cloud-kitchen-2e927',
    storageBucket: 'cloud-kitchen-2e927.firebasestorage.app',
    iosBundleId: 'com.example.cloudKitchen',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-QRXzMQRjCNSBhkyqoPNcVzMkU5F118Y',
    appId: '1:852731056284:ios:c62243f1ccb0120a8a9d59',
    messagingSenderId: '852731056284',
    projectId: 'cloud-kitchen-2e927',
    storageBucket: 'cloud-kitchen-2e927.firebasestorage.app',
    iosBundleId: 'com.example.cloudKitchen',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARfKypHG4_06ky9SQ9VrOFofWeB8n1JVI',
    appId: '1:852731056284:web:458f83761fbb45638a9d59',
    messagingSenderId: '852731056284',
    projectId: 'cloud-kitchen-2e927',
    authDomain: 'cloud-kitchen-2e927.firebaseapp.com',
    storageBucket: 'cloud-kitchen-2e927.firebasestorage.app',
    measurementId: 'G-N6G5DVW1FG',
  );
}
