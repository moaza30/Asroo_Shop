import 'package:e_commerce/logic/controller/settings_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class darkModeWidget extends StatelessWidget {
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            activeTrackColor: mainColor,
            activeColor: mainColor,
            value: controller.switchValue.value,
            onChanged: (value) {
              ThemeController().changeTheme();
              controller.switchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          TextUtils(
              text: "Dark Mode",
              fontSize: 20,
              textColor: Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.none)
        ],
      ),
    );
  }
}
