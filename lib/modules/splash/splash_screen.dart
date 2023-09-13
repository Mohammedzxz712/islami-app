import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/modules/home/home_screen.dart';

import '../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(Assets.imagesSplash, fit: BoxFit.cover),
      ),
    );
  }
}
