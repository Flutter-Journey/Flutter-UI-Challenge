/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-06 08:14:47
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';
import 'package:foods_selection_screen/data/food_data.dart';
import 'package:foods_selection_screen/presentation/detail/widgets/cart_bar.dart';

class DetailScreen extends StatefulWidget {
  final Item data;
  final String tag;

  const DetailScreen({super.key, required this.data, required this.tag});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {
  bool showCart = false;
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 20),
                  _buildRotatingFoodImage(),
                  const Spacer(),
                  _buildFoodTitle(),
                  const SizedBox(height: 10),
                  _buildRating(),
                  const SizedBox(height: 10),
                  _buildDescription(),
                  const Spacer(),
                  _buildPriceAndCartButton(),
                  const Spacer(),
                ],
              ),
            ),
          ),
          // _buildCartBar(context),
          CartBar(
            showCart: showCart,
            onClose: () => setState(() => showCart = false),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        GestureDetector(
          onTap: () => setState(() => showCart = true),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: const Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildRotatingFoodImage() {
    return Center(
      child: RotationTransition(
        turns: _rotationController,
        child: Hero(
          tag: widget.tag,
          child: CircleAvatar(
            radius: 150,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(widget.data.image),
          ),
        ),
      ),
    );
  }

  Widget _buildFoodTitle() {
    return Text(
      widget.data.title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => const Icon(Icons.star, color: Colors.orange, size: 20),
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.data.description,
      style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPriceAndCartButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Giá món: ${widget.data.price} đ",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() => showCart = true);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Thêm món",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
