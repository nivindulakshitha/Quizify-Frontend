import 'package:flutter/material.dart';

class AllQuizzesScreen extends StatelessWidget {
  const AllQuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Quizzes"),
        backgroundColor: const Color(0xFF3366FF),
      ),
      body: const Center(
        child: Text(
          "All Quizzes Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
