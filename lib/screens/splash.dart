import 'dart:async';

import 'package:aspen_explore_application/gen/assets.gen.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(
      Duration(seconds: 3),
      (timer) async {
        final box = GetStorage('appBox');
        final user = await Backendless.userService.getCurrentUser(true);
        await box.write('splashState', true);
        if (user != null) {
          Get.offNamed('/root', arguments: {'user': user});
        } else {
          Get.offNamed('/auth');
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
              color: Colors.white,
              fontFamily: Get.locale == Locale.fromSubtags(languageCode: 'fa')
                  ? 'Graphic'
                  : 'lato'),
        ),
      ),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: ExactAssetImage(Assets.img.background.path),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Iran'.tr,
                  style: TextStyle(fontSize: 160),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 32, top: 16, right: 24, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'See'.tr,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Tourism Areas'.tr,
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomButton(
                      ontap: () async {
                        final box = GetStorage('appBox');
                        final user =
                            await Backendless.userService.getCurrentUser(true);
                        await box.write('splashState', true);
                        if (user != null) {
                          timer?.cancel();
                          Get.offNamed('/root', arguments: {'user': user});
                        } else {
                          Get.offNamed('/auth');
                        }
                      },
                      themeData: themeData,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                            'splashExplore'.tr,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.themeData,
    required this.ontap,
    required this.child,
  });

  final ThemeData themeData;
  final GestureTapCallback ontap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: Get.width,
        // height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              themeData.colorScheme.primary,
              themeData.colorScheme.primaryContainer
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
