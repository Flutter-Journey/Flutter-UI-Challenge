import 'package:flutter/material.dart';
import 'package:foods_selection_screen/presentation/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffebecf1)),
      home: const HomeScreen(),
    );
  }
}