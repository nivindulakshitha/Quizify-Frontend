import 'package:flutter/material.dart';

class SportsQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports Quiz"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "Sports Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
