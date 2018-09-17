import 'package:flutter/material.dart';

class TicTacToe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AspectRatio(aspectRatio: 1.0,
        child: Container(
          color: Colors.yellow,
          padding: EdgeInsets.all(32.0),
          child: Cross()
        ),
        ),
      ),
    );
  }

}

class Cross extends StatefulWidget{
  @override
  CrossState createState() {
    return new CrossState();
  }
}

class CrossState extends State<Cross> with SingleTickerProviderStateMixin {

  double _fraction = 0.0;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
    ..addListener((){
      setState(() {
        _fraction = animation.value;
      });
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: CrossPainter(_fraction),);
  }
}


class CrossPainter extends CustomPainter{

  Paint _paint;
  double _fraction;

  CrossPainter(this._fraction){
    _paint = Paint()
        ..color = Colors.red
        ..strokeWidth = 10.0
        ..strokeCap = StrokeCap.square;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print('paint $_fraction');
    double leftLineFraction, rightLineFraction;

    if(_fraction<0.5){
      leftLineFraction = _fraction/0.5;
      rightLineFraction = 0.0;
    }
    else{
      leftLineFraction = 1.0;
      rightLineFraction = (_fraction - 0.5) / 0.5;
    }

    canvas.drawLine(Offset(0.0, 0.0), Offset(size.width*leftLineFraction, size.height*leftLineFraction), _paint);
    canvas.drawLine(Offset(size.width, 0.0), Offset(size.width - size.width * rightLineFraction, size.height * rightLineFraction), _paint);
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }

}
