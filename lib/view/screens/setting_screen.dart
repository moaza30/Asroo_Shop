import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/theme_controller.dart';

class SettingScreen extends StatelessWidget {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().changeTheme();
              },
              child: Text(
                Get.isDarkMode ? "Light Mode" : "Dark Mode",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(builder: (_) {
              return TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Logout From App",
                    titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                    middleText: "Are sure to logout?",
                    textCancel: " No ",
                    cancelTextColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    textConfirm: " Yes ",
                    confirmTextColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.signOut();
                    },
                    buttonColor: Get.isDarkMode ? Colors.red : mainColor,
                  );
                },
                child: const Text("Sign out"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
