class QuizModel {
  String quizType;
  String ownerId;
  String name;
  String password;
  int duration;
  List<Question> questions;

  QuizModel({
    required this.ownerId,
    required this.quizType,
    required this.name,
    required this.password,
    required this.duration,
    required this.questions,
  });
}

class Question {
  String questionText;
  List<Option> options;
  int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}

class Option {
  int number;
  String optionText;

  Option({
    required this.number,
    required this.optionText,
  });
}
