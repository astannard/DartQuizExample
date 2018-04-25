import 'package:flutter/material.dart';

import 'quizpage.dart';

class ScorePage extends StatelessWidget {
  int _score;
  int _total;

  ScorePage(this._score,this._total);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.pinkAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new QuizPage()
        )),
        child:new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You Scored:",
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 65.0,
              fontWeight: FontWeight.bold,
              decoration: null
            ),),
                new Text(_score.toString()+" out of "+_total.toString(),
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 65.0,
              fontWeight: FontWeight.bold,
              decoration: null
            ),)
          ],
        ),
      )
      
      
    
    );
  }
}