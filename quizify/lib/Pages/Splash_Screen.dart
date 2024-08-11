import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image
            Image.asset(
              'assets/logo.png', // Make sure the image is correctly placed in assets directory
              width: 200.0,
              height: 200.0,
            ),
            const SizedBox(height: 20.0),
            // App Name
          ],
        ),
      ),
    );
  }
}
