import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_logo.dart';
import 'package:flutter_animations/grow_transition.dart';

class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
  }
}

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
    final CurvedAnimation curve =
    new CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curve);
    //..addStatusListener((state) => print("$state"));
    
    animation.addStatusListener((state){
      if(state == AnimationStatus.completed){
        animationController.reverse();
      }else if (state == AnimationStatus.dismissed){
        animationController.forward();
      }
    });

    
    
    animationController.forward();
  }


  Widget build(BuildContext context) {
    return
      //new AnimatedLogo(animation: animation);
      new GrowTransition(child: new LogoWidget(), animation: animation,);
  }

  dispose(){
    animationController.dispose();
    super.dispose();
  }
}