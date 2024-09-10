import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:aspen_explore_application/controllers/navigation_controller.dart';
import 'package:aspen_explore_application/screens/details/details.dart';
import 'package:aspen_explore_application/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.find<NavigationController>().onPopButtonClicked(),
      child: Scaffold(
        bottomNavigationBar: GetBuilder<NavigationController>(
          id: 'Bottom_Navigation',
          builder: (controller) => AnimatedBottomNavigationBar(
            scaleFactor: 0,
            height: 80,
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
              controller.addToHistory(controller.selectedIndex);
              controller.changePage(index);
            },
          ),
        ),
        body: GetBuilder<NavigationController>(
          id: 'Bottom_Navigation',
          builder: (controller) => IndexedStack(
            children: [
              HomeScreen(
                key: controller.screenKeys[0],
              ),
              DetailsScreen(
                key: controller.screenKeys[1],
              ),
            ],
            index: Get.find<NavigationController>().selectedIndex,
          ),
        ),
      ),
    );
  }
}
