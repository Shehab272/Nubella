import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:nubella/views/welcome_screen.dart';
import 'package:nubella/views/home_page.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: Lottie.asset(
            'assets/animation/Animation - 1715028490274.json',
          ),
        ),
        nextScreen: const WelcomeScreen(),
      duration: 1750,
      backgroundColor: Colors.white10,
      splashIconSize:   850,

    );
  }
}


