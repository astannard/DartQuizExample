import 'package:flutter/material.dart';

import 'quizpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new QuizPage()
        )),
        child:new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Human or Imposter",
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: Colors.deepOrangeAccent,
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