import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import '../login/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget screen =  LoginScreen();

  void iniState() {
    super.initState();

    goToLandingScreen().then((value) => setState(() {
          screen = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'images/logo.png',
      duration: 3000,
      nextScreen: screen,
      animationDuration: const Duration(milliseconds: 1000),
      splashIconSize: 500,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }

  Future<Widget> goToLandingScreen() async {
    return  LoginScreen();
  }
}
