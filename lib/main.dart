import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Use the correct import here
  );
  runApp(const ProviderScope(child: RidersOdysseyApp())); // Remove unnecessary 'const'
}

class RidersOdysseyApp extends StatelessWidget {
  const RidersOdysseyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(); // Add a return statement
  }
}
