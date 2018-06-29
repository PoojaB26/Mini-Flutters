import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget{

  static final _opacityTween = new Tween<double>(begin:0.0, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);


  AnimatedLogo({
    Key key, Animation<double> animation})
      :super(key:key, listenable:animation);


  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new Center(
        child: new Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: new FlutterLogo(),
          ),
        )
    );
    /*
    );*/

  }

}