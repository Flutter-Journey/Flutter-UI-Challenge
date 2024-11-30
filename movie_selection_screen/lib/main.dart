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
