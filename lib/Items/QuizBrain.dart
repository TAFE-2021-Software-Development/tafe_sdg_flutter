import 'Qestion.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question("Is SDG UN program?", true),
    Question("Are there are 19 SDG goals?", false),
    Question("Is cleaning ocean part of SDG Goals?", true),
    Question("Did SDG initiated in 2015?", false),
    Question("Is it question 5?", true),
  ];

  String getQuestionStr() {
    return _questionBank[_questionNumber].QuestionStr;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].QuestionAns;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }
}
