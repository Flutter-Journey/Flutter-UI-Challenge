/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-06 08:14:53
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';
import 'package:drinks_selection_screen/widgets/image_carousel.dart';
import 'package:drinks_selection_screen/widgets/logo_widget.dart';
import 'data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  Color _backgroundColor = const Color(0xffb71c1c);

  void _onPageChanged(int index) {
    setState(() {
      _backgroundColor = coffeeList[index].backgroundColor;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuad,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [_backgroundColor, Colors.redAccent],
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.3),
                          blurRadius: 120,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LogoWidget(),
                        _buildCoffeeList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomImageCarousel(
            onPageChange: _onPageChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeList() {
    return Container(
      height: 380,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                final coffee = coffeeList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Giá: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.9),
                                  offset: const Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                          ),
                          TextSpan(
                            text: ' ${coffee.price} ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          const TextSpan(
                            text: 'đ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      coffee.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd32f2f),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      coffee.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },
            ),
          ),
          _buildOrderButton(),
        ],
      ),
    );
  }

  Widget _buildOrderButton() {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0xffb71c1c),
            Color(0xff000000),
            Color(0xfff44336),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x30000000),
            blurRadius: 30,
            spreadRadius: 5,
            offset: Offset(10, 10),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Text(
        "ĐẶT NGAY",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
    );
  }
}
