import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            title: new Text("Flutter Experiments",
              style:  TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  letterSpacing: 1.0
              ),
            ),
            backgroundColor: new Color(0xFF2979FF),
            centerTitle: true
        ),
        body: Container(
          margin: const EdgeInsets.all(15.0),
          child: HomeContent(),
        )
    );
  }
}

class HomeContent extends StatefulWidget{
  @override
  HomeContentState createState() {
    return new HomeContentState();
  }
}

class HomeContentState extends State<HomeContent> with TickerProviderStateMixin {
  AnimationController percentageAnimationController;

  double percentage;
  double newPercentage = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      percentage = 0.0;
    });

    percentageAnimationController = AnimationController(vsync: this,
    duration: Duration(milliseconds: 1000)
    )
    ..addListener(() {
      setState(() {
        percentage = lerpDouble(percentage,newPercentage,percentageAnimationController.value);      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: CustomPaint(
        foregroundPainter: new MyPainter(
            lineColor: Colors.white,
            completeColor: Colors.blueAccent,
            completePercent: percentage,
            width: 8.0
        ),
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new RaisedButton(
              color: Colors.purple,
              splashColor: Colors.blueAccent,
              shape: new CircleBorder(),
              child: new Text("Click"),
              onPressed: (){
                setState(() {
                  percentage = newPercentage;
                  newPercentage += 10;
                  if(newPercentage>100.0){
                    percentage=0.0;
                    newPercentage=0.0;
                  }
                  percentageAnimationController.forward(from: 0.0);
                });
              }),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter({this.lineColor,this.completeColor,this.completePercent,this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
        ..color = lineColor
        ..strokeCap = StrokeCap.square
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;

    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = new Offset(size.width/2, size.height/2);

    double radius = min((size.width/2)-10, (size.height/2)-10);

    canvas.drawCircle(center, radius, line);

    double arcAngle = 2*pi * (completePercent/100);
    
    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        -pi/2,
        arcAngle,
        false,
        complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}