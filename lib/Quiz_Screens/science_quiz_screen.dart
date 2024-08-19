import 'package:flutter/material.dart';

class ScienceQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Science Quiz"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "Science Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
