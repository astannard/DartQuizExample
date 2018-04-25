import 'question.dart';

class Quiz{

  List<Question> questions;
  int _currentQuestionIndex = -1;
  int _score = 0;
  bool _showResult = false;
  bool _answeredCorrect = false;

  Quiz(this.questions);

  Question get nextQuestion {
    _currentQuestionIndex++;
    this._showResult = false;
    if(_currentQuestionIndex >= questions.length) return null;

    return questions[_currentQuestionIndex];
  }

  Question get currentQuestion {
    if(_currentQuestionIndex >= questions.length) return null;

    return questions[_currentQuestionIndex];
  }

  void answer(bool wasCorrect){
    if(wasCorrect) _score++;

    _answeredCorrect = wasCorrect;
  }

  bool get answeredCorrect => _answeredCorrect;
  bool get showResult => _showResult;
  int get length => questions.length;
  bool get quizFinished => questions.length <= this._currentQuestionIndex + 1;
  int get score => this._score;

  void handleAnswer(String answer){
    this.answer(currentQuestion.correctAnswer == answer);
    this._showResult = true;
  }

}