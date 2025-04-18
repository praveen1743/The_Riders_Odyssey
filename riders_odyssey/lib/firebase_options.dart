import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

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
        return linux;
      case TargetPlatform.fuchsia:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions web = FirebaseOptions(
    apiKey: "YOUR_API_KEY",
    appId: "YOUR_APP_ID",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "YOUR_PROJECT_ID",
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: "YOUR_API_KEY",
    appId: "YOUR_APP_ID",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "YOUR_PROJECT_ID",
  ); 

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: "YOUR_API_KEY",
    appId: "YOUR_APP_ID",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "YOUR_PROJECT_ID",
    iosBundleId: "YOUR_IOS_BUNDLE_ID",
  );

  static FirebaseOptions macos = FirebaseOptions(
    apiKey: "YOUR_API_KEY",
    appId: "YOUR_APP_ID",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "YOUR_PROJECT_ID",
    iosBundleId: "YOUR_IOS_BUNDLE_ID",
  );

  static FirebaseOptions windows = FirebaseOptions(
    apiKey: "YOUR_API_KEY",
    appId: "YOUR_APP_ID",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "YOUR_PROJECT_ID",
  );

  static FirebaseOptions linux = FirebaseOptions(
    apiKey: "YOUR_API_KEY",
    appId: "YOUR_APP_ID",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "YOUR_PROJECT_ID",
  );