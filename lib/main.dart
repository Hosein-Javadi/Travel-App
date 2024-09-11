import 'package:aspen_explore_application/Themes/Theme/themes.dart';
import 'package:aspen_explore_application/bindings/bindings.dart';
import 'package:aspen_explore_application/data/database.dart';
import 'package:aspen_explore_application/screens/details/details.dart';
import 'package:aspen_explore_application/screens/home/home.dart';
import 'package:aspen_explore_application/screens/root.dart';
import 'package:aspen_explore_application/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await WidgetsFlutterBinding();
  await GetStorage.init(AppDataBase.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool? viwedSplash = GetStorage('appBox').read('splashState');
    return GetMaterialApp(
      initialBinding: AppBindings(),
      title: 'Flutter Demo',
      themeMode: Get.theme.brightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: AppThemes.darkTheme,
      getPages: [
        GetPage(
          name: '/root',
          page: () => const RootScreen(),
        ),
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/details',
          page: () => const DetailsScreen(),
        ),
      ],

      // Changed Shortly!
      // initialRoute: viwedSplash != null ? '/root' : '/splash',

      //For Test App Uncomment This Line
      initialRoute: '/splash',
    );
  }
}
