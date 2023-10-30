import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_grit_test/start_screens/main_landing_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigatePage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Flutter App',
          style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void navigatePage() async {
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainLandingScreen()))
        );
  }
}
