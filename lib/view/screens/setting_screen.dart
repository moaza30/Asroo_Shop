import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/theme_controller.dart';
import '../widgets/settings/dark_mode_button.dart';
import '../widgets/settings/log_out_widget.dart';
import '../widgets/settings/profile_widget.dart';
import '../widgets/text_utils.dart';

class SettingScreen extends StatelessWidget {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 15,
          ),
          TextUtils(
            fontSize: 20,
            text: "General",
            textColor: mainColor,
            underLine: TextDecoration.none,
          ),
          const SizedBox(
            height: 15,
          ),
          darkModeWidget(),
          const SizedBox(
            height: 15,
          ),
          // languageWidget(),
          const SizedBox(
            height: 15,
          ),
          LogOutButton(),
        ],
      ),
    );
  }
}
