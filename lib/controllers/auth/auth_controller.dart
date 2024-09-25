import 'package:aspen_explore_application/controllers/translate/translate_controller.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

final allowedEmailDomainms = [
  'gmail.com',
  'yahoo.com',
];

class AuthController extends GetxController {
  bool isLogin = false;
  bool signUpHasError = false;
  bool loginHasError = false;
  String loginErrorMessage = '';
  String registerErrorMessage = '';
  void changeLoginState() {
    isLogin = !isLogin;
    update(['authState']);
  }

  void validatelogin(String email, String password) {
    final bool isEnglish = Get.find<TranslateController>().isEnglish;
    String error = '';
    if (email.isEmpty) {
      error += isEnglish ? 'Email Was Null!\n' : 'ایمیل خالی است\n';
    } else if (!EmailValidator.validate(email)) {
      error += isEnglish
          ? 'Email Statement is Not Defind!\n'
          : 'قالب ایمیل صحیح نیست\n';
    }
    if (password.isEmpty) {
      error += isEnglish ? 'Password Was Null!\n' : 'رمز عبور خالی است\n';
    }

    if (error.isNotEmpty) {
      loginHasError = true;
      loginErrorMessage = error;
      update(['loginValidator']);
    } else {
      loginHasError = false;
      loginErrorMessage = '';
      update(['loginValidator']);
    }
  }

  void validateRegister(String email, String password, String rePassword,
      String phoneNumber, String name) {
    final bool isEnglish = Get.find<TranslateController>().isEnglish;
    String error = '';
    if (email.isEmpty) {
      error += isEnglish ? 'Email Was Null\n' : 'ایمیل خالی است\n';
    } else if (!EmailValidator.validate(email, true)) {
      error += isEnglish
          ? 'Email Statement is Not Defind!\n'
          : 'قالب ایمیل صحیح نیست\n';
    } else if (!(allowedEmailDomainms
        .contains(email.substring(email.lastIndexOf('@') + 1)))) {
      error += isEnglish
          ? 'This Domain. Not Allowed!,\n    Allowe Domains : ${allowedEmailDomainms} \n'
          : 'این دامنه برای ثبت نام صحیح نیست،\n قرمت های صحیح : $allowedEmailDomainms \n';
    }
    if (phoneNumber.length < 10) {
      error += isEnglish ? 'The phone number must be at least 10 digits!\n' : 'شماره تلفن باید بیشتر از 10 رقم باشد\n';
    } else if (phoneNumber.length > 15) {
      error += isEnglish ? 'The phone number must be less than 15 digits\n' : 'شماره تلفن باید کمتر از 15 رقم باشد\n' ;
    }
    if (password.isEmpty) {
      error += isEnglish ? 'Password Was Null\n' : 'رمز عبور خالی است \n';
    } else if (password != rePassword) {
      error += isEnglish ? 'Passwords Not Math!\n' : 'تکرار رمز عوبر صحیح نیست \n';
    }
    if (name.isEmpty) {
      error += isEnglish ? 'Name Was Null\n' : 'نام خالی است\n';
    }
    if (error.isNotEmpty) {
      registerErrorMessage = error;
      signUpHasError = true;
      update(['signUpValidator']);
    } else {
      registerErrorMessage = '';
      signUpHasError = false;
      update(['signUpValidator']);
    }
  }

  void signOut() async {
    await Backendless.userService.logout();
  }
}
