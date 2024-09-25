import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:aspen_explore_application/common/common.dart';
import 'package:aspen_explore_application/controllers/home/home_controller.dart';
import 'package:aspen_explore_application/controllers/navigation/navigation_controller.dart';
import 'package:aspen_explore_application/controllers/translate/translate_controller.dart';
import 'package:aspen_explore_application/screens/account/account.dart';
import 'package:aspen_explore_application/screens/details/details.dart';
import 'package:aspen_explore_application/screens/home/bloc/home_bloc.dart';
import 'package:aspen_explore_application/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    Common.showMenuSnakBarInfo(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.find<NavigationController>().onPopButtonClicked(),
      child: Scaffold(
        bottomNavigationBar: GetBuilder<NavigationController>(
          id: 'Bottom_Navigation',
          builder: (controller) => AnimatedBottomNavigationBar(
            scaleFactor: 0,
            splashColor: Colors.transparent,
            splashRadius: 0,
            height: 80,
            icons: const [
              Icons.home_filled,
              Icons.details,
              Icons.account_circle_outlined
            ],
            shadow: BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
              blurRadius: 30,
              spreadRadius: 15,
            ),
            leftCornerRadius: 35,
            rightCornerRadius: 35,
            activeIndex: controller.selectedIndex,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.defaultEdge,
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Theme.of(context).colorScheme.onSurface,
            backgroundColor: Theme.of(context).colorScheme.surface,
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
              MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) {
                      Get.find<HomeController>().addEvent(HomeStarted(
                          isEnglish:
                              Get.find<TranslateController>().isEnglish));
                      return Get.find<HomeController>().bloc;
                    },
                  ),
                ],
                child: HomeScreen(
                  key: controller.screenKeys[0],
                ),
              ),
              DetailsScreen(
                key: controller.screenKeys[1],
              ),
              AccountScreen(
                key: controller.screenKeys[2],
              ),
            ],
            index: Get.find<NavigationController>().selectedIndex,
          ),
        ),
      ),
    );
  }
}
