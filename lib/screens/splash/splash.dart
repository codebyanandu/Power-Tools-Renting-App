import 'dart:async';
import 'package:flutter/material.dart';
import 'package:power_tools_renting_app/app/utils/colors.dart';
import 'package:power_tools_renting_app/app/utils/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnimation = Tween<double>(
      begin: .91,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, .25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //     transitionDuration: const Duration(milliseconds: 500),
      //     pageBuilder: (_, animation, __) => const LoginScreen(),
      //     transitionsBuilder: (_, animation, __, child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //   ),
      // );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AColors.backgroundClr,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AColors.primaryClr.withOpacity(.08),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AColors.primaryClr.withOpacity(.08),
                            ),
                          ),
                          child: Icon(
                            Icons.construction_rounded,
                            size: 60,
                            color: AColors.primaryClr,
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          kAppName,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            letterSpacing: .5,
                            color: AColors.primaryClr,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Rent Professional Tools Easily",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: AColors.primaryClr,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
