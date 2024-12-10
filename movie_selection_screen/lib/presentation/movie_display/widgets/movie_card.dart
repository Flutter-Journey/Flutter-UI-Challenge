/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-04 16:51:05
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';
import 'package:movie_selection_screen/model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Size size;
  final bool isCurrent;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.size,
    required this.isCurrent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: movie.title,
                  child: Container(
                    height: 350,
                    width: size.width * 0.55,
                    margin: const EdgeInsets.only(top: 20),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                      movie.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  movie.title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  movie.director,
                  style: const TextStyle(fontSize: 16, color: Colors.black45),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: isCurrent ? 1.0 : 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildIconText(Icons.star, movie.rating, Colors.amber),
                        _buildIconText(Icons.access_time, movie.duration, Colors.black45),
                        _buildIconText(Icons.play_circle, "Watch", Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconText(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.black45),
        ),
      ],
    );
  }
}
