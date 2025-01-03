import 'package:flutter/material.dart';

const kBaseSize = 350.0;
const kOffset = 40.0;
const kColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

void main() => runApp(const RainbowApp());

class RainbowApp extends StatelessWidget {
  const RainbowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              for (int i = 0; i < kColors.length; i++) ...[
                RotatedBox(
                  quarterTurns: 3,
                  child: SizedBox(
                    width: kBaseSize - (kOffset * i),
                    height: kBaseSize - (kOffset * i),
                    child: CircularProgressIndicator(
                      value: .5,
                      strokeWidth: 20,
                      color: kColors[i],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
