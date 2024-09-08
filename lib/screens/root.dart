import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:aspen_explore_application/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<NavigationController>(
        id: 'Bottom_Navigation',
        builder: (controller) => AnimatedBottomNavigationBar(
          icons: const [
            Icons.home_filled,
            Icons.details,
          ],
          shadow: BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 30,
            spreadRadius: 20,
          ),
          leftCornerRadius: 35,
          rightCornerRadius: 35,
          activeIndex: controller.selectedIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.defaultEdge,
          activeColor: Colors.blue.shade700,
          inactiveColor: Colors.grey[400],
          onTap: (index) {
            controller.changePage(index);
          },
        ),
      ),
    );
  }
}
