import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isLogin = false;
  void changeState() {
    isLogin = !isLogin;
    update(['authState']);
  }
}
