import 'package:flutter/material.dart';

void main() { // 1
  runApp( // 2
      new MaterialApp( //3
        home: new Screen1(), //4
        routes: <String, WidgetBuilder> { //5
          '/screen1': (BuildContext context) => new Screen1(), //6
          '/screen2' : (BuildContext context) => new Screen2() //7
        },
      )
  );
}

class Screen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // 1
      appBar: new AppBar( //2
        title: new Text("Screen 1"),

      ),
      body: new Center( // 3
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed:(){ // 4
              button1(context); // 5
            } ,child: new Text("Go to Screen 2"),)
          ],
        ),
      ) ,
    );
  }
}

class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen 2"),

      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed:(){
              button2(context);
            } ,child: new Text("Back to Screen 1"),)
          ],
        ),
      ) ,
    );

  }
}

void button1(BuildContext context){
  print("Button 1"); //1
  Navigator.of(context).pushNamed('/screen2'); //2
}

void button2(BuildContext context){
  print("Button 2"); //3
  Navigator.of(context).pushNamed('/screen1');//4
}
