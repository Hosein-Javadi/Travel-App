import 'package:aspen_explore_application/controllers/auth/auth_controller.dart';
import 'package:aspen_explore_application/screens/auth/bloc/auth_bloc.dart';
import 'package:aspen_explore_application/screens/auth/repo/repository.dart';
import 'package:aspen_explore_application/screens/auth/source/source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

final TextEditingController sNameController = TextEditingController();
final TextEditingController sEmailController = TextEditingController();
final TextEditingController sPhoneNumberController = TextEditingController();
final TextEditingController sPasswordController = TextEditingController();
final TextEditingController sRePasswordController = TextEditingController();
final TextEditingController lEmailController = TextEditingController();
final TextEditingController lPasswordController = TextEditingController();

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),
              foregroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onSurface),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
          ),
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black))),
      child: Scaffold(
        body: BlocProvider(
          create: (context) {
            final bloc = AuthBloc(AuthRepository(source: AuthRemoteSource()));
            return bloc;
          },
          child: GetBuilder<AuthController>(
            id: 'authState',
            init: AuthController(),
            builder: (controller) {
              if (controller.isLogin)
                return LoginSection(mainContext: context);
              else
                return SingUpSection(
                  mainContext: context,
                );
            },
          ),
        ),
      ),
    );
  }
}

class LoginSection extends StatelessWidget {
  const LoginSection({
    super.key,
    required this.mainContext,
  });
  final BuildContext mainContext;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            alignment: Alignment.topCenter,
            decoration:
                BoxDecoration(color: Theme.of(mainContext).colorScheme.surface),
            child: Container(
              width: 85,
              height: 85,
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: Theme.of(mainContext).colorScheme.onSurface,
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.bubble_left_fill,
                  size: 40,
                  color: Theme.of(mainContext).colorScheme.surface,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(mainContext).colorScheme.onSurface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 48, left: 18, right: 18),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 36),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        CustomTextField(
                          controller: lEmailController,
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          label: 'Email',
                          iconData: Icons.email_outlined,
                          themeData: Theme.of(mainContext),
                        ),
                        CustomTextField(
                          controller: lPasswordController,
                          textInputType: TextInputType.text,
                          obscureText: true,
                          label: 'Password',
                          iconData: Icons.lock_outline_sharp,
                          themeData: Theme.of(mainContext),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GetBuilder<AuthController>(
                          id: 'loginValidator',
                          builder: (controller) {
                            if (controller.loginHasError)
                              return ErrorText(
                                  errorMessage: controller.loginErrorMessage);
                            return SizedBox();
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: Get.width,
                          height: 65,
                          child: AcceptButton(
                            child: Text('Login'),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BottomText(
                              text: 'Don\'t Have Any Account? Sign Up',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          top: 280,
          left: 0,
          right: 0,
          bottom: 0,
        ),
      ],
    );
  }
}

class AcceptButton extends StatelessWidget {
  const AcceptButton({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authloading) {
          return ElevatedButton(
            onPressed: () {},
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        } else if (state is AuthError) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) async {
              await Get.defaultDialog(
                title: 'Error',
                middleText: state.exception.toString().substring(
                    44, state.exception.toString().lastIndexOf(', code')),
                confirm: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.surface),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              );
            },
          );
        } else if (state is AuthSucess) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) async {
              await Get.defaultDialog(
                title: 'Success',
                middleText: 'Welcome!',
                confirm: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.surface),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              );
              BlocProvider.of<AuthBloc>(context).add(AuthStarted());
              Get.toNamed('/splash');
            },
          );
        }

        return mainButton(context);
      },
    );
  }

  ElevatedButton mainButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final AuthController controller = Get.find<AuthController>();
        final bool state = controller.isLogin;
        if (state) {
          controller.validatelogin(
              lEmailController.text, lPasswordController.text);
        } else {
          controller.validateRegister(
              sEmailController.text,
              sPasswordController.text,
              sRePasswordController.text,
              sPhoneNumberController.text,
              sNameController.text);
        }
        if (state && !controller.loginHasError) {
          BlocProvider.of<AuthBloc>(context).add(
            AuthLogin(
              email: lEmailController.text,
              password: lPasswordController.text,

            ),
          );
        } else if (!state && !controller.signUpHasError) {
          BlocProvider.of<AuthBloc>(context).add(
            AuthRegister(
              name: sNameController.text,
              email: sEmailController.text,
              phoneNumber: sPhoneNumberController.text,
              password: sPasswordController.text,
            ),
          );
        }
      },
      child: child,
    );
  }
}

class SingUpSection extends StatelessWidget {
  const SingUpSection({
    super.key,
    required this.mainContext,
  });
  final BuildContext mainContext;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            alignment: Alignment.topCenter,
            decoration:
                BoxDecoration(color: Theme.of(mainContext).colorScheme.surface),
            child: Container(
              width: 85,
              height: 85,
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: Theme.of(mainContext).colorScheme.onSurface,
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.bubble_left_fill,
                  size: 40,
                  color: Theme.of(mainContext).colorScheme.surface,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(mainContext).colorScheme.onSurface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 48, left: 18, right: 18),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    CustomTextField(
                      controller: sNameController,
                      textInputType: TextInputType.text,
                      obscureText: false,
                      label: 'Name',
                      iconData: Icons.account_circle_outlined,
                      themeData: Theme.of(mainContext),
                    ),
                    CustomTextField(
                      controller: sEmailController,
                      textInputType: TextInputType.emailAddress,
                      obscureText: false,
                      label: 'Email',
                      iconData: Icons.email_outlined,
                      themeData: Theme.of(mainContext),
                    ),
                    CustomTextField(
                      controller: sPhoneNumberController,
                      textInputType: TextInputType.phone,
                      obscureText: false,
                      label: 'Phone Number',
                      iconData: Icons.phone,
                      themeData: Theme.of(mainContext),
                    ),
                    CustomTextField(
                      controller: sPasswordController,
                      textInputType: TextInputType.text,
                      obscureText: true,
                      label: 'Password',
                      iconData: Icons.lock_outline_sharp,
                      themeData: Theme.of(mainContext),
                    ),
                    CustomTextField(
                      controller: sRePasswordController,
                      textInputType: TextInputType.text,
                      obscureText: true,
                      label: 'Re Password',
                      iconData: Icons.lock_outline_rounded,
                      themeData: Theme.of(mainContext),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    GetBuilder<AuthController>(
                      id: 'signUpValidator',
                      builder: (controller) {
                        if (controller.signUpHasError)
                          return ErrorText(
                              errorMessage: controller.registerErrorMessage);
                        return SizedBox();
                      },
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 65,
                      child: AcceptButton(
                        child: Text('Register'),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    BottomText(
                      text: 'Have a Account? Login',
                    ),
                    SizedBox(
                      height: 36,
                    ),
                  ],
                ),
              ),
            ),
          ),
          top: 280,
          left: 0,
          right: 0,
          bottom: 0,
        ),
      ],
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.find<AuthController>().changeLoginState();
        },
        child: Text(text));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.iconData,
    required this.themeData,
    required this.obscureText,
    required this.textInputType,
    required this.controller,
  });

  final String label;
  final IconData iconData;
  final ThemeData themeData;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          color: themeData.colorScheme.primary,
        ),
        label: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      autocorrect: false,
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          errorMessage,
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
