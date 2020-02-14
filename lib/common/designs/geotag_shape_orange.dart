import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {

  final Size size;

  CurvePainter(this.size){}

  @override
  void paint(Canvas canvas, Size size) {

    size = this.size;
    final headHeight = size.height * .35;

    var paint = Paint();
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.relativeMoveTo(200, 400);
    path.relativeCubicTo((1.5)/4*size.height, 0, 0.6*size.height, 1/2*size.height, 0, size.height);
    path.relativeCubicTo(-0.6*size.height, -1/2*size.height, (-1.5)/4*size.height, -size.height, 0, -size.height);
    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}