import 'package:flutter/material.dart';
import 'package:treva_mock/ui/home/HomePage.dart';
import 'package:treva_mock/ui/home/DetailPage.dart';


void main() {
 // Routes.initRoutes();
  runApp(new MaterialApp(
    title: "Planets",
    home: new HomePage(),
   /* routes: <String, WidgetBuilder>{
      '/detail': (_) => new DetailPage(),
    },*/
  ));
}