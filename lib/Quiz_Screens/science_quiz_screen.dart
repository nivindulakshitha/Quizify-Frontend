import 'package:flutter/material.dart';

class ScienceQuizScreen extends StatelessWidget {
  const ScienceQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Science Quiz"),
        backgroundColor: const Color(0xFF3366FF),
      ),
      body: const Center(
        child: Text(
          "Science Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
