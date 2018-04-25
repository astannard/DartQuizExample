import 'package:flutter/material.dart';
import 'dart:math';
//import 'package:emoticons/emoticons.dart';

class CorrectWrongOverlay extends StatefulWidget {


final bool _isCorrect;
final VoidCallback _onTap;

CorrectWrongOverlay(this._isCorrect, this._onTap);

@override
State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin{


  Animation<double> _iconAnimateion;
  AnimationController _iconAnimationController;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      duration: new Duration(seconds: 2),
      vsync: this
    );
    _iconAnimateion = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.elasticOut);
    _iconAnimateion.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

      @override
    void dispose() {
      _iconAnimationController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(
                angle: _iconAnimateion.value * 2 * PI,
                child: new Icon(
                  widget._isCorrect == true ? Icons.check_circle : Icons.cancel,
                  size: _iconAnimateion.value * 125.0,
                  color: widget._isCorrect == true ? Colors.greenAccent : Colors.redAccent
                ),
              )
            ),
            new Padding(padding: new EdgeInsets.only(bottom:7.0)),
            new Text(
              widget._isCorrect == true ? "Correct!":"Wrong!",
              style: new TextStyle(
                color: Colors.white,
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold
                
              ),
              )
          ],
        )
      ),
    );
  }
}