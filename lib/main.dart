import 'package:aspen_explore_application/Themes/Theme/themes.dart';
import 'package:aspen_explore_application/Translate/translate.dart';
import 'package:aspen_explore_application/bin/bindings.dart';
import 'package:aspen_explore_application/data/common/common.dart';
import 'package:aspen_explore_application/screens/auth/signup.dart';
import 'package:aspen_explore_application/screens/details/details.dart';
import 'package:aspen_explore_application/screens/home/home.dart';
import 'package:aspen_explore_application/screens/root/root.dart';
import 'package:aspen_explore_application/screens/splash.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Backendless.initApp(
    androidApiKey: '5E9BBFA8-E6A7-4738-9C8E-062FBD73D98B',
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
    final String? localeStatte =
        GetStorage(CommonDataBase.boxName).read(CommonDataBase.localeBoxName);
    return GetMaterialApp(
      locale: localeStatte != null && localeStatte == 'en'
          ? Locale('en')
          : localeStatte != null && localeStatte == 'fa'
              ? Locale('fa')
              : Locale('en'),
      translations: AppTranslator(),
      initialBinding: AppBindings(),
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
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
      initialRoute: '/splash',
      // initialRoute: '/auth',
    );
  }
}
