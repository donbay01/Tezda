import 'package:e_commerce/pages/homepage.dart';
import 'package:e_commerce/pages/splash_screen/splashScreen.dart';
import 'package:e_commerce/service/auth.dart';
import 'package:flutter/material.dart';

class TezdaApp extends StatelessWidget {
  const TezdaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = AuthService.getCurrentUser();

    if (user == null) {
      return const SplashScreen();
    }

    return const HomePage();
  }
}
