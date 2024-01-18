import 'package:flutter/material.dart';

class LinePainter extends CustomPainter{
  final double width;
  final Color color;

  const LinePainter({
    this.width = 2.0,
    this.color = Colors.black
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width;

    final startPoint = Offset(0, size.height / 2); // Titik awal garis
    final endPoint = Offset(size.width, size.height / 2); // Titik akhir garis

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}


class CirclePainter extends CustomPainter{
  final Color color;
  final Offset offset;

  const CirclePainter({
    this.color = const Color.fromARGB(255, 48, 174, 98),
    this.offset = const Offset(200, 200)
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

      canvas.drawCircle(offset, 100, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}