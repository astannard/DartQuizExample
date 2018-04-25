import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  
  String text;
  Color colour;
  final VoidCallback _onTap;

  AnswerButton(this.text, this.colour, this._onTap);
  
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: this.colour,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Text(
                this.text,
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 37.2,
                  fontWeight: FontWeight.bold
                )),
            ),
          )
        ),
      ),

    );
  }
}