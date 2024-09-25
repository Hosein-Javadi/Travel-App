import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemeController extends GetxController {
  void changeTheme(bool isDark) {
    // Get.changeTheme(isDark ? ThemeData.dark() : ThemeData.light());
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  // ThemeData getTheme(bool isDark) {
  //   if (isDark) {
  //     return AppThemes.darkTheme;
  //   }
  //   return AppThemes.lightTheme;
  // }
}
