import 'package:flutter/material.dart';
import 'package:quizify/Services/api_service.dart';

class JoinQuizWidget extends StatelessWidget {
  final TextEditingController _quizIdController = TextEditingController();
  final TextEditingController _quizPasswordController = TextEditingController();

  final VoidCallback onJoinQuiz;

  JoinQuizWidget({super.key, required this.onJoinQuiz});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _quizIdController,
            decoration: const InputDecoration(
              labelText: 'Quiz ID',
              hintText: 'Enter Quiz ID',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _quizPasswordController,
            decoration: const InputDecoration(
              labelText: 'Quiz Password',
              hintText: 'Enter Quiz Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> response =
                    await getRequest('quiz/take/${quizId}');

                if (response['success']) {
                  Map<String, dynamic> response =
                      await postRequest('quiz/match-passwords', {
                    'quizId': quizId,
                    'password': quizPassword,
                  });

                  if (response['success']) {
                    onJoinQuiz();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Invalid password for the given quiz ID')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('No quiz found with the given ID')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Join'),
            ),
          ),
        ],
      ),
    );
  }

  String get quizId => _quizIdController.text;
  String get quizPassword => _quizPasswordController.text;
}
