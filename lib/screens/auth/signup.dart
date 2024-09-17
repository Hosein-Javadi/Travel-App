import 'package:aspen_explore_application/controllers/auth/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        body: GetBuilder<AuthController>(
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
            child: Padding(
              padding: const EdgeInsets.only(top: 48, left: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        label: 'Email',
                        iconData: Icons.email_outlined,
                        themeData: Theme.of(mainContext),
                      ),
                      CustomTextField(
                        textInputType: TextInputType.text,
                        obscureText: true,
                        label: 'Password',
                        iconData: Icons.lock_outline_sharp,
                        themeData: Theme.of(mainContext),
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 65,
                        child: AcceptButton(
                          text: 'Login',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: BottomText(text: 'Have a Account? Login'),
                  ),
                ],
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
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
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
              padding: const EdgeInsets.only(top: 48, left: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        label: 'Email',
                        iconData: Icons.email_outlined,
                        themeData: Theme.of(mainContext),
                      ),
                      CustomTextField(
                        textInputType: TextInputType.text,
                        obscureText: true,
                        label: 'Password',
                        iconData: Icons.lock_outline_sharp,
                        themeData: Theme.of(mainContext),
                      ),
                      CustomTextField(
                        textInputType: TextInputType.text,
                        obscureText: true,
                        label: 'Re Password',
                        iconData: Icons.lock_outline_rounded,
                        themeData: Theme.of(mainContext),
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 65,
                        child: AcceptButton(text: 'Register'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: BottomText(
                      text: 'Don\'t Have Any Account? Sign Up',
                    ),
                  ),
                ],
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
          Get.find<AuthController>().changeState();
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
  });

  final String label;
  final IconData iconData;
  final ThemeData themeData;
  final bool obscureText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
