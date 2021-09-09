import 'package:flutter/material.dart';
//import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xff7F93DF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.8112500);
    path_0.quadraticBezierTo(size.width * 0.0206250, size.height * 0.6596875,
        size.width * 0.3075000, size.height * 0.6300000);
    path_0.cubicTo(
        size.width * 0.5012500,
        size.height * 0.6084375,
        size.width * 0.4362500,
        size.height * 0.4696875,
        size.width * 0.5875000,
        size.height * 0.4612500);
    path_0.cubicTo(
        size.width * 0.8537500,
        size.height * 0.4375000,
        size.width * 0.8593750,
        size.height * 0.2234375,
        size.width * 0.6025000,
        size.height * 0.1362500);
    path_0.cubicTo(
        size.width * 0.4693750,
        size.height * 0.0590625,
        size.width * 0.4418750,
        size.height * 0.0325000,
        size.width * 0.5000000,
        size.height * 0.0012500);
    path_0.quadraticBezierTo(
        size.width * 0.6856250, size.height * 0.0028125, size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.8112500);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xff3A40B1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2362500);
    path_0.quadraticBezierTo(size.width * 0.1456250, size.height * 0.2471875,
        size.width * 0.1775000, size.height * 0.2725000);
    path_0.cubicTo(
        size.width * 0.2268750,
        size.height * 0.2981250,
        size.width * 0.4006250,
        size.height * 0.4193750,
        size.width * 0.4825000,
        size.height * 0.3987500);
    path_0.cubicTo(
        size.width * 0.6018750,
        size.height * 0.3400000,
        size.width * 0.5400000,
        size.height * 0.2696875,
        size.width * 0.6225000,
        size.height * 0.2500000);
    path_0.quadraticBezierTo(size.width * 0.7393750, size.height * 0.2393750,
        size.width, size.height * 0.1875000);
    path_0.lineTo(size.width, size.height * 0.0012500);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.2362500);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
