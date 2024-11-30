import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TimeSelection extends StatefulWidget {
  const TimeSelection({super.key});

  @override
  State<TimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  int selectedColor = 0;

  List<String> time = [
    '10:00 AM',
    '01:00 PM',
    '03:00 PM',
    '06:00 PM',
    '08:00 PM',
    '10:00 PM',
    '12:00 AM',
    '02:00 AM',
    '04:00 AM',
  ];

  List<Color> colors = [
    const Color(0xFF9B1B30), // Deep Red
    const Color(0xFF1B5C3D), // Emerald Green
    const Color(0xFF0F1A2E), // Midnight Blue
    const Color(0xFFF1C40F), // Cinematic Gold
    const Color(0xFF333333), // Charcoal Black
    const Color(0xFF6A1B9A), // Purple
    const Color(0xFF0288D1), // Blue
    const Color(0xFF43A047), // Green
    const Color(0xFFFF7043), // Coral
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          delay: const Duration(milliseconds: 500),
          child: const Text(
            "Movies Show Times",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // List of movie show times
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: time.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = index;
                  });
                },
                child: FadeInUp(
                  delay: Duration(
                    milliseconds: (index * 100),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(microseconds: 400),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: selectedColor == index ? 3 : 0,
                          color: selectedColor == index
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        shape: BoxShape.circle,
                        color: selectedColor == index
                            ? colors[index]
                            : colors[index].withOpacity(0.6)),
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Text(
                        time[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedColor == index
                              ? Colors.white
                              : Colors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
