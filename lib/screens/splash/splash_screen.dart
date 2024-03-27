import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/download.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
