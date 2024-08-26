import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizify/Models/quiz_model.dart';
import 'package:quizify/Models/quiz_provider.dart';
import 'package:quizify/Models/user_provider.dart';

class CreateQuizWidget extends StatelessWidget {
  final int questionNumber;
  final int totalQuestions;

  CreateQuizWidget(
      {super.key, required this.questionNumber, required this.totalQuestions});

  final _answerControllers =
      List.generate(4, (index) => TextEditingController());
  final TextEditingController questionController = TextEditingController();
  final TextEditingController correctAnswerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Create Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Question $questionNumber',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: questionNumber / totalQuestions,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Quiz Question',
                hintText: 'Enter your question here',
                border: OutlineInputBorder(),
              ),
              controller: questionController,
            ),
            const SizedBox(height: 16),
            const Text(
              'Quiz Answers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildAnswerField('A', _answerControllers[0]),
            const SizedBox(height: 8),
            _buildAnswerField('B', _answerControllers[1]),
            const SizedBox(height: 8),
            _buildAnswerField('C', _answerControllers[2]),
            const SizedBox(height: 8),
            _buildAnswerField('D', _answerControllers[3]),
            const SizedBox(height: 16),
            const Text(
              'Correct Answer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildCorrectAnswerDropdown(),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (questionNumber == totalQuestions) {

                    quizProvider.setOwnerId(userProvider.user!.id);

                    Map<String, dynamic> response = await
                        quizProvider.submitQuiz();

                    if (response['success']) {
                      var data = response['data'];

                      _showShareQuizDialog(context, data['name'], data['_id'], quizProvider.quiz.password, data['link']);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(response['message']),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      print(response['error']);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(response['message']),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } else {
                    // TODO: Add validation for empty fields
                    quizProvider.addQuestion(Question(
                        questionText: questionController.text,
                        options: [
                          Option(
                              number: 0,
                              optionText: _answerControllers[0].text),
                          Option(
                              number: 1,
                              optionText: _answerControllers[1].text),
                          Option(
                              number: 2,
                              optionText: _answerControllers[2].text),
                          Option(
                              number: 3, optionText: _answerControllers[3].text)
                        ],
                        correctOptionIndex: _getCorrectOptionIndex(
                            _answerControllers, correctAnswerController)));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateQuizWidget(
                          questionNumber: questionNumber + 1,
                          totalQuestions: totalQuestions,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: Text(
                    questionNumber == totalQuestions ? 'All done' : 'Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerField(String label, TextEditingController controller) {
    return Row(
      children: [
        Text(
          '$label.',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter answer $label',
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCorrectAnswerDropdown() {
    return DropdownButtonFormField<String>(
      items: ['A', 'B', 'C', 'D'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        // Handle the correct answer selection
        switch (newValue) {
          case 'A':
            {
              correctAnswerController.text = _answerControllers[0].text;
              break;
            }

          case 'B':
            {
              correctAnswerController.text = _answerControllers[1].text;
              break;
            }

          case 'C':
            {
              correctAnswerController.text = _answerControllers[2].text;
              break;
            }

          case 'D':
            {
              correctAnswerController.text = _answerControllers[3].text;
              break;
            }
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

  void _showShareQuizDialog(BuildContext context, dynamic name, dynamic id, dynamic password, dynamic link) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShareQuizDialog(
          quizName: name,
            quizId: id.replaceAllMapped(RegExp(r'\d{3}'), (match) => '${match.group(0)} ').trim(),
          password: password,
          // TODO: Invite link cannot be placed within the dialog, it should be shared via the share button
          inviteLink: link,
        );
      },
    );
  }
}

int _getCorrectOptionIndex(
  dynamic answerControllers,
  dynamic correctAnswerController,
) {
  for (int index = 0; index < answerControllers.length; index++) {
    if (correctAnswerController.text == answerControllers[index].text) {
      return index;
    }
  }
  return -1;
}

class ShareQuizDialog extends StatelessWidget {
  final String quizName;
  final String quizId;
  final String password;
  final String inviteLink;

  const ShareQuizDialog({
    super.key,
    required this.quizName,
    required this.quizId,
    required this.password,
    required this.inviteLink,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Share Your Quiz',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  quizName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Quiz ID', quizId),
            const SizedBox(height: 8),
            _buildInfoRow('Password', password, isPassword: true),
            const SizedBox(height: 8),
            _buildInfoRow('Invite Link', inviteLink, isLink: true),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle share action here
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Share Links'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value,
      {bool isPassword = false, bool isLink = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: isLink ? Colors.blue : Colors.black,
                decoration:
                    isLink ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
            if (isPassword) const SizedBox(width: 4),
            if (isPassword) const Icon(Icons.visibility, size: 16),
          ],
        ),
      ],
    );
  }
}
