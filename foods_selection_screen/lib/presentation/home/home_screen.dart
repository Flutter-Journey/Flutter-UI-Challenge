/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-06 08:14:47
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';
import 'package:foods_selection_screen/data/food_data.dart';
import 'widgets/menu_item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.sort, color: Colors.black),
        actions: [
          _buildActionIcon(context, Icons.shopping_cart),
          _buildActionIcon(context, Icons.search, margin: const EdgeInsets.only(right: 20)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "MENU",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Đã đến lúc tận hưởng những điều tốt đẹp hơn trong cuộc sống",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.55,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return MenuItemCard(data: items[index], index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionIcon(BuildContext context, IconData icon, {EdgeInsets? margin}) {
    return Container(
      height: 40,
      width: 40,
      margin: margin ?? const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withOpacity(0.2),
            offset: const Offset(2, 4),
            blurRadius: 6,
          ),
          const BoxShadow(
            color: Colors.white70,
            offset: Offset(-2, -4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Icon(icon, color: Colors.black),
    );
  }
}
