import 'dart:math';

import 'package:flutter/material.dart';
import 'package:drinks_selection_screen/data.dart';

class CustomImageCarousel extends StatefulWidget {
  final Function(int) onPageChange;

  const CustomImageCarousel({super.key, required this.onPageChange});

  @override
  State<CustomImageCarousel> createState() => _CustomImageCarouselState();
}

class _CustomImageCarouselState extends State<CustomImageCarousel> {
  final double viewPortFraction = 0.5;
  late final PageController pageController;

  int currentPage = 2;
  double page = 2.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentPage,
      viewportFraction: viewPortFraction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 300,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                setState(() {
                  page = pageController.page!;
                });
              }
              return true;
            },
            child: PageView.builder(
              onPageChanged: (pos) {
                setState(() {
                  currentPage = pos;
                });
                widget.onPageChange(pos);
              },
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                final scale = max(
                  scaleFraction,
                  (fullScale - (index - page).abs()) + viewPortFraction,
                );
                return _imageWidget(coffeeList[index].image, scale);
              },
            ),
          ),
        ),
        const SizedBox(height: 350),
      ],
    );
  }

  Widget _imageWidget(String image, double scale) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          SizedBox(
            height: pagerHeight * scale,
            width: 100 * scale,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Container(
            height: 5,
            width: 50 * scale,
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
            ),
          ),
        ],
      ),
    );
  }
}
