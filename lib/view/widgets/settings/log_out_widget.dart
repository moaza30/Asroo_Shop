import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogOutButton extends StatelessWidget {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              title: "Logout From App",
              titleStyle: const TextStyle(fontWeight: FontWeight.bold),
              middleText: "Are sure to logout?",
              textCancel: " No ",
              cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
              textConfirm: " Yes ",
              confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.signOut();
              },
              buttonColor: Get.isDarkMode ? Colors.red : mainColor,
            );
          },
          splashColor: mainColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              TextUtils(
                  text: "Log Out",
                  fontSize: 20,
                  textColor: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none)
            ],
          ),
        ),
      ),
    );
  }
}
