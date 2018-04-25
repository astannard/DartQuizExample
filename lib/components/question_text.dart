import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {

  String text;

  QuestionText(this.text);


  @override
  Widget build(BuildContext context) {
    
    return new Material(
      color: Colors.black,
      child: new Padding(
        padding: new EdgeInsets.all(30.0),
        child: new Center(
          child: new Text(
            this.text,
            style: new TextStyle(
              fontSize: 45.3,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );

  }
}