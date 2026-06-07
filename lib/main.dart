import 'package:flutter/material.dart';
import 'package:power_tools_renting_app/app/utils/strings.dart';
import 'package:power_tools_renting_app/app/themes/themes.dart';
import 'package:power_tools_renting_app/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: ATheme.lightTheme,
      darkTheme: ATheme.darkTheme,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
