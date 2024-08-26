import 'package:flutter/material.dart';
import 'quiz_model.dart';
import 'package:quizify/Services/api_service.dart';

class QuizProvider with ChangeNotifier {
  final QuizModel _quiz = QuizModel(
    quizType: '',
    name: '',
    password: '',
    duration: 0,
    questions: [],
  );

  QuizModel get quiz => _quiz;

  void setType(String type) {
    _quiz.quizType = type;
    notifyListeners();
  }

  void setName(String name) {
    _quiz.name = name;
    notifyListeners();
  }

  void setPassword(String password) {
    _quiz.password = password;
    notifyListeners();
  }

  void setDuration(int duration) {
    _quiz.duration = duration;
    notifyListeners();
  }

  void addQuestion(Question question) {
    _quiz.questions.add(question);
    notifyListeners();
  }

  Future<Map<String, dynamic>> submitQuiz() async {
    final response = await postRequest('quiz/create', {
      'quizType': quiz.quizType,
        'name': quiz.name,
        'password': quiz.password,
        'duration': quiz.duration,
        'questions': quiz.questions.map((q) => {
          'question': q.questionText,
          'options': q.options.map((o) => {
            'number': o.number,
            'option': o.optionText,
          }).toList(),
          'correctOption': q.correctOptionIndex,
        }).toList(),
      });
      
      return response;
  }
}
