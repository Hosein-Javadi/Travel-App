import 'package:aspen_explore_application/Themes/Theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemeController extends GetxController {

  void changeTheme(bool isDark) {
    Get.changeTheme(getTheme(isDark));
  }

  ThemeData getTheme(bool isDark) {
    if (isDark) {
      return AppThemes.darkTheme;
    }
    return AppThemes.lightTheme;
  }
}
