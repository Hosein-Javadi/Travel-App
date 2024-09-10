import 'package:get/get.dart';

class AppTextController extends GetxController {
  bool detailsisElpises = true;

  void detailsChangeElips() {
    detailsisElpises = !detailsisElpises;
    update(['detailsElipses']);
  }
}
