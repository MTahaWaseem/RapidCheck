import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Account Screens/login.dart';
import 'nav_bar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 0.0;
  bool isLoggedIn = false;
  bool isLoading = true;

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 100), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });

    Timer(Duration(seconds: 2), () {
      checkLoginStatus();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => isLoggedIn ? Navbar() : Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
          ),
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/images/logo.jpeg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
