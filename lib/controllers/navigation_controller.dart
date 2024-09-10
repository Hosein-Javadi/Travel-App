import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum NavigationPageNames { home, details }

final pages = {
  NavigationPageNames.home: 0,
  NavigationPageNames.details: 1,
};
final pagesIndex = {
  0: NavigationPageNames.home,
  1: NavigationPageNames.details,
};

GlobalKey<NavigatorState> homeScreen = GlobalKey();
GlobalKey<NavigatorState> detailsScreen = GlobalKey();

class NavigationController extends GetxController {
  final screenKeys = {
    0: homeScreen,
    1: detailsScreen,
  };

  int selectedIndex = 0;
  final List<int> history = [];

  Future<bool> onPopButtonClicked() async {
    final currentPage = screenKeys[selectedIndex];
    print('t');
    if (currentPage?.currentState != null &&
        currentPage!.currentState!.canPop()) {
      Get.back();
      update(['Bottom_Navigation']);
      return false;
    }
    if (history.isNotEmpty) {
      selectedIndex = history.last;
      history.removeLast();
      update(['Bottom_Navigation']);
      return false;
    }
    return true;
  }

  void changePage(int index) {
    selectedIndex = pages[pagesIndex[index]]!;
    update(['Bottom_Navigation']);
  }

  void addToHistory(int index) {
    if (!history.contains(index)) {
      history.add(index);
    }
  }
}
