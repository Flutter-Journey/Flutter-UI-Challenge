/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-04 16:51:05
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_selection_screen/model.dart';
import 'package:movie_selection_screen/presentation/detail_screen/movie_detail.dart';
import 'package:movie_selection_screen/presentation/movie_display/widgets/movie_card.dart';

class MovieDisplay extends StatefulWidget {
  const MovieDisplay({super.key});

  @override
  State<MovieDisplay> createState() => _MovieDisplayState();
}

int current = 0;

class _MovieDisplayState extends State<MovieDisplay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            // Background image
            Image.network(
              movieItems[current].image,
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),

            // BackgroundGradient
            _buildBackgroundGradient(size),

            // Movie Slide Card
            Positioned(
              top: size.height / 2 - (size.height * 0.7) / 2 + 30,
              left: size.width / 2 - size.width / 2,
              height: size.height * 0.7,
              width: size.width,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 550,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                ),
                itemCount: movieItems.length,
                itemBuilder: (context, index, realIdx) {
                  final movie = movieItems[index];
                  return MovieCard(
                    movie: movie,
                    size: size,
                    isCurrent: current == index,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MovieDetail(movie: movie),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundGradient(Size size) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.grey.shade900.withOpacity(0.8),
              Colors.grey.shade700.withOpacity(0.6),
              Colors.grey.shade100.withOpacity(0.3),
              Colors.grey.shade50.withOpacity(0.0),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
      ),
    );
  }
}
