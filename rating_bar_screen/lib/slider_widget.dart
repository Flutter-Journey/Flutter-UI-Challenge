/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-04 16:51:07
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';

class SliderWidget extends StatelessWidget {
  final double lowerValue;
  final Function(double) onDragging;
  final Function(double) onDragCompleted;

  const SliderWidget({
    super.key,
    required this.lowerValue,
    required this.onDragging,
    required this.onDragCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: FlutterSlider(
        values: [lowerValue],
        min: 0.0,
        max: 9.0,
        trackBar: FlutterSliderTrackBar(
          inactiveTrackBar: BoxDecoration(color: Colors.grey.shade700),
          activeTrackBarHeight: 8,
          activeTrackBar: BoxDecoration(
            color: const Color(0xFFEF8354),
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        handler: FlutterSliderHandler(
          child: Material(
            type: MaterialType.canvas,
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Icon(Icons.arrow_forward_ios, size: 25),
            ),
          ),
        ),
        handlerAnimation: const FlutterSliderHandlerAnimation(
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: 700),
          scale: 1.4,
        ),
        tooltip: FlutterSliderTooltip(disabled: true),
        onDragging: (handlerIndex, lowerValue, upperValue) => onDragging(lowerValue),
        onDragCompleted: (handlerIndex, lowerValue, upperValue) => onDragCompleted(lowerValue),
      ),
    );
  }
}
