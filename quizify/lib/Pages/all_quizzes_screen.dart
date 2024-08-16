import 'package:flutter/material.dart';

class AllQuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Quizzes"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "All Quizzes Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
