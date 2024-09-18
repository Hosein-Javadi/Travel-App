import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

final allowedEmailDomainms = [
  'gmail.com',
  'yahoo.com',
];

class AuthController extends GetxController {
  bool isLogin = false;
  bool remember = false;
  bool signUpHasError = false;
  bool loginHasError = false;
  String loginErrorMessage = '';
  String registerErrorMessage = '';
  void changeLoginState() {
    isLogin = !isLogin;
    update(['authState']);
  }

  void changeRememberState() {
    remember = !remember;
    update(['authState']);
  }

  void validatelogin(String email, String password) {
    String error = '';
    if (email.isEmpty) {
      error += 'Email Was Null!\n';
    } else if (!EmailValidator.validate(email)) {
      error += 'Email Statement is Not Defind!\n';
    }
    if (password.isEmpty) {
      error += 'Password Was Null!';
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
    String error = '';
    if (email.isEmpty) {
      error += 'Email Was Null\n';
    } else if (!EmailValidator.validate(email, true)) {
      error += 'Email Statement is Not Defind!\n';
    } else if (!(allowedEmailDomainms
        .contains(email.substring(email.lastIndexOf('@') + 1)))) {
      error +=
          'This Domain. Not Allowed!,\n    Allowe Domains : ${allowedEmailDomainms} \n';
    }
    if (phoneNumber.length < 10) {
      error += 'The phone number must be at least 10 digits!\n';
    } else if (phoneNumber.length > 15) {
      error += 'The phone number must be less than 15 digits\n';
    }
    if (password.isEmpty) {
      error += 'Password Was Null\n';
    } else if (password != rePassword) {
      error += 'Passwords Not Math!\n';
    }
    if (name.isEmpty) {
      error += 'Name Was Null\n';
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
