import 'package:aspen_explore_application/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(Assets.img.background.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
                top: 56,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Iran',
                          style: TextStyle(fontSize: 160),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'See',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            'Tourism Areas',
                            style: TextStyle(
                                fontSize: 42, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32, top: 16),
                            child: CustomButton(
                              ontap: () async {
                                final box = GetStorage('appBox');
                                await box.write('splashState', true);
                                Get.offNamed('/root');
                              },
                              themeData: themeData,
                              child: const Center(
                                child: Text(
                                  'Explore',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
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
        height: 45,
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
