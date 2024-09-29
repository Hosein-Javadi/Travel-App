import 'package:aspen_explore_application/controllers/auth/auth_controller.dart';
import 'package:aspen_explore_application/controllers/home/home_controller.dart';
import 'package:aspen_explore_application/controllers/navigation/navigation_controller.dart';
import 'package:aspen_explore_application/controllers/Text/text_controller.dart';
import 'package:aspen_explore_application/controllers/Theme/theme_controller.dart';
import 'package:aspen_explore_application/controllers/translate/translate_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NavigationController(),
      fenix: true,
    );
    Get.lazyPut(() => AppTextController(),fenix: true);

    Get.lazyPut(
      () => AppThemeController(),
      fenix: true,
    );

    Get.put(AuthController(), permanent: true);

    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );

    Get.lazyPut(
      () => TranslateController(),
      fenix: true,
    );

    // Get.put(TranslateController(), permanent: true);
  }
}
