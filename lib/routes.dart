import 'package:flutter/material.dart';
import 'package:nubella/splash_screen.dart';
import 'package:nubella/views/chat_view.dart';
import 'package:nubella/views/home_page.dart';
import 'package:nubella/views/signin_screen.dart';
import 'package:nubella/views/signup_screen.dart';
import 'package:nubella/views/welcome_screen.dart';

abstract class AppRoutes {
  static const splashScreen = "/";
  static const homeView = "/homeView";
  static const chatView = "/chatView";
  static const welcomeView = "/welcomeView";
  static const signInView = "/signInView";
  static const signUpView = "/signUpView";
  static Map<String, Widget Function(BuildContext)> routes = {
    homeView: (context) => const HomePage(),
    welcomeView: (context) => const WelcomeScreen(),
    signInView: (context) => const SignInView(),
    signUpView: (context) => const SignUpView(),
    chatView: (context) => const ChatView(),
  };
}
