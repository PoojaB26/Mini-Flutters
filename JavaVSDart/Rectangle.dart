import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;
  
  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  @override
String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
  
}

main() {
    print(new Rectangle(origin: const Point(10, 20)));
} // Included main() to suppress uncaught exception.
