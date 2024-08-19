import 'package:flutter/material.dart';

class JoinQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join Quiz"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "Join Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
