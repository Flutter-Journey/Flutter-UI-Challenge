import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  double sliderPosition;
  final double dragPercent;
  final Paint linePainter;
  final Paint indicatorPainter;
  final TextPainter minValuePainter;
  final TextPainter maxValuePainter;
  final TextPainter selectedValuePainter;

  final int minValue;
  final int maxValue;
  static int _selectedValue = 0;
  final double indicatorMargin;

  LinePainter({
    required this.maxValue,
    required this.minValue,
    required this.indicatorMargin,
    required this.sliderPosition,
    required this.dragPercent,
  })  : selectedValuePainter = TextPainter(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "$_selectedValue",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.45 + indicatorMargin,
                )))
          ..textDirection = TextDirection.ltr,
        maxValuePainter = TextPainter(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "$maxValue",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                )))
          ..textDirection = TextDirection.ltr,
        minValuePainter = TextPainter(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "$minValue",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                )))
          ..textDirection = TextDirection.ltr,
        indicatorPainter = Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill,
        linePainter = Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.9;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(0, size.height / 2);

    _selectedValue = (sliderPosition / size.width * 100).toInt();

    double controlHeight = indicatorMargin;
    double bezierWidth = 40.0;
    double bendWidth = 40.0;
    double indicatorRadius = 8.5;

    double centerPoint = sliderPosition;
    centerPoint = centerPoint > size.width ? size.width : centerPoint;

    double startBend = sliderPosition - bendWidth / 2;
    double startOfBezier = startBend - bezierWidth;
    double endBend = sliderPosition + bendWidth / 2;
    double endOfBezier = endBend + bezierWidth;
    double lcp1 = startBend;
    double lcp2 = startBend;
    double rcp1 = endBend;
    double rcp2 = endBend;

    startBend = (startBend <= 0.0) ? 0.0 : startBend;
    startOfBezier = (startOfBezier <= 0.0) ? 0.0 : startOfBezier;
    endBend = (endBend >= size.width) ? size.width : endBend;
    endOfBezier = (endOfBezier >= size.width) ? size.width : endOfBezier;

    Path p = Path();
    p.moveTo(-25, 0);
    p.lineTo(startOfBezier, 0);

    p.cubicTo(lcp1, 0, lcp2, -controlHeight, centerPoint, -controlHeight);
    p.cubicTo(rcp1, -controlHeight, rcp2, 0, endOfBezier, 0);
    p.lineTo(size.width + 25, 0);
    canvas.drawPath(p, linePainter);

    canvas.drawCircle(
        Offset(sliderPosition, 24.5 - indicatorMargin), indicatorRadius, indicatorPainter);

    selectedValuePainter.layout();
    selectedValuePainter.paint(
        canvas, Offset((sliderPosition - indicatorRadius), -42 - indicatorMargin - controlHeight));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
