import 'package:flutter/material.dart';
import 'package:quizify/widgets/join_quiz_widget.dart';

class JoinQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Join in Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: JoinQuizWidget(
        onJoinQuiz: () {
          _validateAndProceed(context);
        },
      ),
    );
  }

  void _validateAndProceed(BuildContext context) {
    // Replace with the actual logic to validate quiz ID and password
    // For now, just use dummy data to simulate successful join
    String quizId = '858 888 584'; // Hardcoded for example
    String quizPassword = '123456'; // Hardcoded for example

    if (quizId == '858 888 584' && quizPassword == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizDetailsScreen(),
        ),
      );
    } else {
      // Handle error: show a message that the credentials are incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Quiz ID or Password')),
      );
    }
  }
}

class QuizDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('XYZ Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Quiz found!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'XYZ Quiz',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Created by',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://example.com/user-avatar.jpg'), // Replace with the actual avatar
              ),
              title: Text('Nadun Daluwatta'),
            ),
            SizedBox(height: 16),
            Text(
              'Quiz Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            _buildQuizDetailRow('Quiz Type', 'MCQ'),
            SizedBox(height: 8),
            _buildQuizDetailRow('Number of Questions', '15'),
            SizedBox(height: 8),
            _buildQuizDetailRow('Quiz Duration', '10 min'),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StartQuizScreen(),
                    ),
                  );
                },
                child: Text('Start Quiz Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class StartQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the Start Quiz screen here
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('XYZ Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Start Quiz Screen - Implement Questions Here'),
      ),
    );
  }
}
