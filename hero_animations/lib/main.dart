
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set background to blue to emphasize that it's a new route.
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.topLeft,
        child: PhotoHero(
          photo: 'https://pbs.twimg.com/profile_images/972154872261853184/RnOg6UyU_400x400.jpg',
          width: 100.0,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

}

class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    timeDilation = 10.0; // 1.0 means normal animation speed.

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PhotoHero(
          photo: 'https://pbs.twimg.com/profile_images/972154872261853184/RnOg6UyU_400x400.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SecondScreen()));
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HeroAnimation()));
}