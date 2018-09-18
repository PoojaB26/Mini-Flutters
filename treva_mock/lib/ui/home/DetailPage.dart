import 'package:flutter/material.dart';
import 'package:treva_mock/model/Planet.dart';

class DetailPage extends StatelessWidget{

  Container _getBackground(){
    return new Container(
      child: new Image.network(planet.image,
      fit: BoxFit.cover,
        height: 300.0),
      constraints: new BoxConstraints.expand(height:300.0),

    );
  }
  final Planet planet;
  DetailPage(this.planet);
  @override
    Widget build(BuildContext context) {
      return new Scaffold(body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
           /* _getGradient(),
            _getContent(),
            _getToolbar(context),*/
          ],
        ),
          ),
      );
    }
  }