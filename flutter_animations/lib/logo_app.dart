import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_logo.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;


  initState(){
    super.initState();
    animationController = new AnimationController(vsync: this,
        duration: const Duration(milliseconds: 200)
    );

    animation = new Tween(begin: 0.0, end: 300.0).animate(animationController)
      ..addListener((){
        setState(() {

        });
      });

    animationController.forward();
  }


  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }

  dispose(){
    animationController.dispose();
    super.dispose();
  }
}