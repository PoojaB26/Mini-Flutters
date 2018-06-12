import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new AwesomeButtons(),
    );
  }
}

class AwesomeButtons extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new AwesomeButtonsState();

}

class AwesomeButtonsState extends State<AwesomeButtons> {

  int counter = 0;
  List<String> strings = ["Flutter", "is", "Awesome"];
  String currentString = "";

  void _onPressed(){
    setState(() {
      currentString = strings[counter];
      counter = counter < 2 ? counter+1 : 0;

    });
  }
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Scaffold Widget"),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Text(currentString),
              new RaisedButton(
                  child: new Text("Donuts"),
                  onPressed: _onPressed)
            ],
          ),
        ),
      );
  }
}
