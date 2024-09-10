import 'package:aspen_explore_application/controllers/navigation_controller.dart';
import 'package:aspen_explore_application/controllers/text_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NavigationController(),
    );
    Get.put(AppTextController());
  }
}
