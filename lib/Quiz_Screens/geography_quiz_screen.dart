import 'package:flutter/material.dart';

class GeographyQuizScreen extends StatelessWidget {
  const GeographyQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geography Quiz"),
        backgroundColor: const Color(0xFF3366FF),
      ),
      body: const Center(
        child: Text(
          "Geography Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
