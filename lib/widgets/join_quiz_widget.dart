import 'package:flutter/material.dart';

class JoinQuizWidget extends StatelessWidget {
  final TextEditingController _quizIdController = TextEditingController();
  final TextEditingController _quizPasswordController = TextEditingController();

  final VoidCallback onJoinQuiz;

  JoinQuizWidget({required this.onJoinQuiz});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _quizIdController,
            decoration: InputDecoration(
              labelText: 'Quiz ID',
              hintText: 'Enter Quiz ID',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          TextField(
            controller: _quizPasswordController,
            decoration: InputDecoration(
              labelText: 'Quiz Password',
              hintText: 'Enter Quiz Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onJoinQuiz,
              child: Text('Join'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get quizId => _quizIdController.text;
  String get quizPassword => _quizPasswordController.text;
}
