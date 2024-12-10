/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-04 16:51:05
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';
import 'package:movie_selection_screen/presentation/movie_display/movie_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MovieDisplay());
  }
}
