import 'package:aspen_explore_application/controllers/auth/auth_controller.dart';
import 'package:aspen_explore_application/screens/splash.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final BackendlessUser args = Get.arguments['user'];
    print('test');
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 64, right: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 65,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                foregroundColor: Theme.of(context).colorScheme.surface,
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 130,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                args.properties['name'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                height: 45,
              ),
              AccountItem(
                title: 'Phone :',
                caption: args.properties['phone'],
              ),
              SizedBox(
                height: 25,
              ),
              AccountItem(
                title: 'Email :',
                caption: args.properties['email'],
              ),
              SizedBox(
                height: 36,
              ),
              CustomButton(
                themeData: ThemeData(
                  colorScheme: ColorScheme.light(
                    primary: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                ontap: () {
                  Get.defaultDialog(
                    title: 'Warning',
                    titleStyle: TextStyle(color: Colors.orange),
                    middleText: 'Are You Sure Want To logout?',
                    middleTextStyle: TextStyle(color: Colors.red),
                    textCancel: 'Cancell',
                    cancel: button(
                      Colors.green,
                      'Cancell',
                      () => Get.back(),
                    ),
                    confirm: button(
                      Colors.red,
                      'Logout',
                      () {
                        Get.find<AuthController>().signOut();
                        Get.offAllNamed('/auth');
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(Color color, String text, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
          child: Center(child: Text(text))),
    );
  }
}

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.title,
    required this.caption,
  });
  final String title;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, bottom: 16, top: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(title),
                SizedBox(
                  width: 8,
                ),
                Text(caption),
              ],
            )
          ],
        ),
      ),
    );
  }
}
