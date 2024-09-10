import 'package:aspen_explore_application/bindings/bindings.dart';
import 'package:aspen_explore_application/data/database.dart';
import 'package:aspen_explore_application/screens/details/details.dart';
import 'package:aspen_explore_application/screens/home/home.dart';
import 'package:aspen_explore_application/screens/root.dart';
import 'package:aspen_explore_application/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
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
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        )),
        popupMenuTheme: PopupMenuThemeData(
          position: PopupMenuPosition.over,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          iconColor: Color(0xff176FF2),
        ),
        iconTheme: IconThemeData(color: Color(0xff176FF2)),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        ),
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: Color(0xff176FF2),
          primaryContainer: Color(0xff196EEE),
          onPrimary: Color(0xFFFFFFFF),
          surface: Color(0XffFFFFFF),
          onSurface: Color(0xff000000),
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
      initialRoute: viwedSplash != null ? '/root' : '/splash',

      //For Test App Uncomment This Line
      // // initialRoute: '/splash',
    );
  }
}
