import 'package:flutter/material.dart';

class BiologyQuizScreen extends StatelessWidget {
  const BiologyQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biology Quiz"),
        backgroundColor: const Color(0xFF3366FF),
      ),
      body: const Center(
        child: Text(
          "Biology Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
