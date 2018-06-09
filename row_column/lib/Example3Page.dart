import 'package:flutter/material.dart';

class Example3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleRow = new Row(
      children: <Widget>[
        new Icon(Icons.people),
        new Expanded(
          child: new Container(
            padding: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new Text('This is quite a long name that will be cut off',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
        new Text('0111 222 333'),
      ],
    );


    Widget textSection = new Container(
      color: new Color(0X3300CC00),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          titleRow,
          new Text('We have a description here. It may fit on 2 lines, '
              'or it may fit on 1 line. Or will require more lines than 2, but'
              ' we only show 2 lines maximum f f f f f f f f f f f f f f f .',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,)
        ],

      )

    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example 3"),
      ),
      body: new Padding(
          padding: new EdgeInsets.symmetric(
              vertical: 0.0, horizontal: 0.0),
        child: new Container(
          color: new Color(0X33000000),
          child: new Row(children: <Widget>[
            new IconButton(
              onPressed: null, // Not implemented in this code tutorial
              icon: new Icon(Icons.send),
            ),
            new Expanded(
                child: textSection),
            new IconButton(
              onPressed: null, // Not implemented in this code tutorial
              icon: new Icon(Icons.edit),
            ),
          ],),
        ),

      ),
    );



  }

}