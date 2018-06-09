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
              vertical: 0.0, horizontal: 0.0)
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

  );

  Widget middleSection = new Container(

  );

  Widget bottomSection = new Container(


  );
}