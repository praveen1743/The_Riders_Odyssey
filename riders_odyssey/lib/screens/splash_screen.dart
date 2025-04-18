import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:riders_odyssey/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/logo.png'),
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      duration: 3000,
    );
  }
}