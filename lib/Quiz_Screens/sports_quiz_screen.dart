import 'package:flutter/material.dart';

class SportsQuizScreen extends StatelessWidget {
  const SportsQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports Quiz"),
        backgroundColor: const Color(0xFF3366FF),
      ),
      body: const Center(
        child: Text(
          "Sports Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
