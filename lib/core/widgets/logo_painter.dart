import 'package:flutter/material.dart';

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00f5d4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;
    canvas.scale(scale, scale);

    final path1 = Path()
      ..moveTo(16, 18)
      ..lineTo(22, 12)
      ..lineTo(16, 6)
      ..moveTo(8, 6)
      ..lineTo(2, 12)
      ..lineTo(8, 18);
    canvas.drawPath(path1, paint);

    final path2 = Path()
      ..moveTo(14.5, 4)
      ..lineTo(9.5, 20);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


