import 'package:flutter/material.dart';
import '../util/quiz.dart';
import '../util/question.dart';
import '../util/answer.dart';

import '../components/question_text.dart';
import '../components/answer_button.dart';
import '../components/correct_wrong_overlay.dart';


import 'scorepage.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => new _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  Quiz quiz;
  bool showResult;
  _QuizPageState(){

  }

  @override
  void initState(){
    super.initState();
    //showResult = false;
    quiz = new Quiz(
      [
        new Question("Is maggie smith a ","robot",[
        new Answer("witch",Colors.blueAccent),
        new Answer("robot", Colors.purpleAccent),
        new Answer("human", Colors.redAccent)
      ]),
      new Question("Is Prince Harry a ?","Lizard",[
        new Answer("Human",Colors.blueAccent),
        new Answer("Lizard", Colors.purpleAccent),
        new Answer("Zombie", Colors.redAccent)
      ])]
    );
    this.quiz.nextQuestion;
  }

  List<Widget> getQuestionWidget(){
    
    var questionWidgets = new List<Widget>();
    if(this.quiz.currentQuestion!=null){

        var question = this.quiz.currentQuestion.question;
        var answers = this.quiz.currentQuestion.answers;

        questionWidgets.add(new QuestionText(question));

        for(var answer in answers){
          questionWidgets.add(new AnswerButton(
            answer.text,
            answer.colour,
            //this is a blocl lambda below:
            ()  {
              quiz.handleAnswer(answer.text);
              this.setState(()  {
                showResult = true;
              });
              
            }
          ));
        }

        return questionWidgets;
    }

  } 

  void handleNextQuestion() {
           if(this.quiz.quizFinished){
             Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
               builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)
             ),(Route route)=>route==null);
             return;
           }
            quiz.nextQuestion;
   this.setState((){
             
           });
         }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
           new Material(
            color: Colors.orangeAccent,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getQuestionWidget()
            ),
          ),
          this.quiz.showResult == true ? new CorrectWrongOverlay(
            this.quiz.answeredCorrect, () => this.handleNextQuestion()
          ): new Container()
      ],
    );
    
    
    
    

  }
}