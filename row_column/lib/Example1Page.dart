import 'package:flutter/material.dart';

import 'Example2Page.dart';
import 'Example3Page.dart';

class Example1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> menu = <Widget>[
      new IconButton(
        icon: new Icon(Icons.send),
        tooltip: 'To Example 2',
        onPressed: () => _toExample2(context),
       // onPressed: () => null,

      ),
      new IconButton(
        icon: new Icon(Icons.help),
        tooltip: 'To Example 3',
        onPressed: () => _toExample3(context),
        //onPressed: () => null,

      )
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example 1"),
        actions: menu,
      ),
      body: new Padding(
          padding: new EdgeInsets.symmetric(
              vertical: 0.0, horizontal: 0.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: <Widget>[
            subtitle,
            middleSection,
            bottomSection
          ],
        ),
      ),
    );


  }
  void _toExample2(BuildContext context){
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new Example2Page();
          }
          ));
  }

  void _toExample3(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new Example3Page();
        }
    ));
  }

  Widget subtitle = new Container(
    padding: new EdgeInsets.all(8.0),
    color: new Color(0X33000000),
    child: new Text('Subtitle'),
  );

  Widget middleSection = new Expanded(
    child: new Container(
      padding: new EdgeInsets.all(8.0),
      color: new Color(0X9900CC00),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Text('Some data here'),
          new Text('More stuff here'),
        ],
      ),

    ),
  );

  Widget bottomSection = new Container(
    padding: new EdgeInsets.all(8.0),
    color: new Color(0X99CC0000),
    height: 48.0,
    child: new Center(
      child: new MaterialButton(
        onPressed: null,
        child: new Text("Hi"),),
    ),

  );
}