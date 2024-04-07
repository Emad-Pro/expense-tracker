import 'dart:math';

import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

class PieChartPainter extends CustomPainter {
  final Map<String, double>? data;
  final BuildContext context;
  PieChartPainter({
    required this.context,
    this.data,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Calculate the total value of all categories
    final total = data?.values.reduce((a, b) => a + b);

    // Calculate the start and end angles for each category
    var startAngle = 0.0;
    var endAngle = 0.0;
    for (var entry in data!.entries) {
      final fraction = entry.value / total!;
      endAngle += 2 * pi * fraction;

      // Generate a random color for each category
      final color = randomColorScheme().primary;

      // Draw the arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        endAngle - startAngle,
        true,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill,
      );

      // Calculate label position
      final labelRadius = radius / 1.5;
      final angle = startAngle + (endAngle - startAngle) / 2;
      final labelX = center.dx + cos(angle) * labelRadius;
      final labelY = center.dy + sin(angle) * labelRadius;

      // Draw label text
      final textPainter = TextPainter(
        text: TextSpan(
          text:
              "${entry.key.tr(context)} - ${((entry.value / total) * 100).toStringAsFixed(1)} %",
          style: const TextStyle(
            //  color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 100, maxWidth: size.width - 200);
      textPainter.paint(
          canvas,
          Offset(
              labelX - textPainter.width / 2, labelY - textPainter.height / 2));

      startAngle = endAngle;
    }
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) {
    return oldDelegate.data != data;
  }
}
