import 'package:flutter/material.dart';
import 'package:nubella/routes.dart';
import 'package:nubella/splash_screen.dart';

import 'views/home_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nubella',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: AppRoutes.routes,
    );
    }
}
