import 'package:aspen_explore_application/bindings/bindings.dart';
import 'package:aspen_explore_application/screens/root.dart';
import 'package:aspen_explore_application/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool? viwedSplash = GetStorage().read('splashState');
    return GetMaterialApp(
      initialBinding: AppBindings(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: Color(0xff176FF2),
          primaryContainer: Color(0xff196EEE),
          onPrimary: Color(0xFFFFFFFF),
          surface: Color(0XffFFFFFF),
          onSurface: Color(0xff0000),
        ),
      ),
      getPages: [
        GetPage(
          name: '/root',
          page: () => const RootScreen(),
        ),
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        )
      ],
      initialRoute: viwedSplash != null ? '/root' : '/splash',
    );
  }
}
