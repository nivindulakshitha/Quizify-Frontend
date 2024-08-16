import 'package:flutter/material.dart';

class BiologyQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biology Quiz"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "Biology Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
