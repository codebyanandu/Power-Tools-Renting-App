import 'dart:async';

import 'package:flutter/material.dart';
import 'package:power_tools_renting_app/app/utils/colors.dart';
import 'package:power_tools_renting_app/app/utils/strings.dart';
import 'package:power_tools_renting_app/screens/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            kAppName,
            style: TextStyle(
              fontSize: 24,
              color: AColors.primaryClr,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
