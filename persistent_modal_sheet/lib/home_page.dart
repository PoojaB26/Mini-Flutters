
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersistentBottomSheetCallack;

  @override
  void initState() {
    super.initState();
    _showPersistentBottomSheetCallack = _showBottomSheet;
  }

  void _showBottomSheet(){
    setState(() {
      _showPersistentBottomSheetCallack = null;
    });

    _scaffoldKey.currentState.showBottomSheet((context){
      return new Container(
        color: Colors.red,

      );
    }).closed.whenComplete((){
      if(mounted) {
        print(" mounted");
        setState(() {
          _showPersistentBottomSheetCallack = _showBottomSheet;
        });
      }else print("not mounted");
    });
  }

  void _showModalSheet(){
    showModalBottomSheet(context: context,
        builder: (builder){
          return new Container(
            color: Colors.red,

          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Flutter BottomSheet"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  onPressed: _showPersistentBottomSheetCallack,
                  child: new Text("Persistent"),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                ),
                new RaisedButton(
                  onPressed: _showModalSheet,
                  child: new Text("Modal"),
                ),
              ],
            )),
      ),
    );
  }
}