import 'package:flutter/material.dart';
import 'package:treva_mock/ui/home/PlanetRow.dart';
import 'package:treva_mock/model/Planet.dart';

class HomePageBody extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Expanded(
      child: new ListView.builder(
        itemBuilder: (context, index) => new PlanetRow(planets[index]),
        itemCount: planets.length,
        itemExtent: 152.0,
      ),
    );

}
  }
