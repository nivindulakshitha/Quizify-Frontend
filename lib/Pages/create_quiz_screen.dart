import 'package:flutter/material.dart';

class CreateQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Quiz"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "Create Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
