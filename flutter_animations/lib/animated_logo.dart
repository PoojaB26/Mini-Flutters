import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget{

  AnimatedLogo({
    Key key, Animation<double> animation})
      :super(key:key, listenable:animation);


  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height:animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );

  }

}