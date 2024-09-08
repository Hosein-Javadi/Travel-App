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

class NavigationController extends GetxController {
  int selectedIndex = 0;

  void changePage(int index) {
    selectedIndex = pages[pagesIndex[index]]!;
    update(['Bottom_Navigation']);
  }
}
