import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/settings_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  final controller = Get.find<SettingsController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(authController.userPhoto.isEmpty
                        ? "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"
                        : authController.userPhoto.value),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      text: controller.capitalize(
                        authController.displayName.value,
                      ),
                      fontSize: 22,
                      textColor: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none),
                  const SizedBox(height: 5),
                  TextUtils(
                      text: authController.displayEmail.value,
                      fontSize: 15,
                      textColor: Colors.grey,
                      underLine: TextDecoration.none),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
