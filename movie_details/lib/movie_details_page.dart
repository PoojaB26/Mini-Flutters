import 'package:flutter/material.dart';
import 'models.dart';

class MovieDetailsPage extends StatelessWidget{
  MovieDetailsPage(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}