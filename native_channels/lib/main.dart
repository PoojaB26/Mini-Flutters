import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter-Native Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Channel demo app'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const platform = const MethodChannel(
      'flutter.rortega.com.basicchannelcommunication');
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key) {
    platform.setMethodCallHandler(_handleMethod);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text('Show native view'),
              onPressed: _showNativeView,
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _showNativeView() async {
//    final String result = await platform.invokeMethod('showNativeView');
//    print("result $result");

    String _message;
    try {
      final String result = await platform.invokeMethod('showNativeView');
      print("result from main $result");
    } on PlatformException catch (e) {
      _message = "Sadly I can not change your life: ${e.message}.";
    }
//    setState(() {
//      nativeMessage = _message;
//    });
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch(call.method) {
      case "message":
        debugPrint(call.arguments);
        return new Future.value("");
    }
  }
}
