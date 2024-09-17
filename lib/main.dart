import 'package:aspen_explore_application/Themes/Theme/themes.dart';
import 'package:aspen_explore_application/bindings/bindings.dart';
import 'package:aspen_explore_application/data/common/common.dart';
import 'package:aspen_explore_application/screens/auth/signup.dart';
import 'package:aspen_explore_application/screens/details/details.dart';
import 'package:aspen_explore_application/screens/home/home.dart';
import 'package:aspen_explore_application/screens/root.dart';
import 'package:aspen_explore_application/screens/splash.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  Backendless.initApp(
    androidApiKey: 'E1E4F060-98EC-4FBD-A960-B5B9EE5DC138',
    applicationId: 'CE6D37F1-85C5-4B48-992D-E23FF815A4B0',
    iosApiKey: '52DA1761-1A7E-4B09-BF31-8C3AD3D058C0',
  );
  await GetStorage.init(CommonDataBase.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
        GetPage(
          name: '/auth',
          page: () => const AuthScreen(),
        ),
      ],

      // Changed Shortly!
      // initialRoute: viwedSplash != null ? '/root' : '/splash',

      //For Test App Uncomment This Line
      // initialRoute: '/splash',
      initialRoute: '/auth',
    );
  }
}
