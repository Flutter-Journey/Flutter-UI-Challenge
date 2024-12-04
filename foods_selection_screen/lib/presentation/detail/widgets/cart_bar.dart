import 'package:flutter/material.dart';
import 'package:foods_selection_screen/data/food_data.dart';

class CartBar extends StatelessWidget {
  final bool showCart;
  final Function() onClose;

  const CartBar({
    super.key,
    required this.showCart,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutBack,
      right: showCart ? 10 : -150,
      top: MediaQuery.sizeOf(context).height * 0.2,
      bottom: MediaQuery.sizeOf(context).height * 0.2,
      child: Container(
        width: 100,
        height: MediaQuery.sizeOf(context).height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onClose,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: const Icon(Icons.close, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Đơn mua",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) =>
                        Image.asset(items[index].image, height: 50),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Tổng:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${items.length} món",
                    style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 5),
                const Text("250.000 đ",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
