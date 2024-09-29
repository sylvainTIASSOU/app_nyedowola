import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Couleur de la bordure
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();

    double dashWidth = 10;
    double dashSpace = 5;
    double startX = 0;
    double startY = 0;
    final borderRadius = 20.0;

    // Create a rounded rectangle path
    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    // Extract the border path from the rounded rectangle
    Path borderPath = Path()..addRRect(rRect);

    // Iterate over the border path and create dashed effect
    for (PathMetric pathMetric in borderPath.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double nextDistance = distance + dashWidth;
        path.addPath(
          pathMetric.extractPath(distance, nextDistance),
          Offset.zero,
        );
        distance = nextDistance + dashSpace;
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}