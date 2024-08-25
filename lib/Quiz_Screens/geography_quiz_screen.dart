import 'package:flutter/material.dart';

class GeographyQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geography Quiz"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "Geography Quiz Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
