import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/strings.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth_widgets/auth_button.dart';
import '../../widgets/auth_widgets/auth_form_field.dart';
import '../../widgets/text_utils.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: mainColor),
        centerTitle: true,
        title: TextUtils(
            text: "Forget Password",
            fontSize: 16,
            textColor: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextUtils(
                    text:
                        "If you want to recover your account, then provide your email below..",
                    fontSize: 15,
                    textColor: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none),
                Image.asset(
                  "assets/images/forgetpass copy.png",
                  height: 250,
                ),
                AuthTextFormField(
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return "Please enter valid email";
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  hideText: false,
                  prefixIcon: Image.asset("assets/images/email.png"),
                  suffixIcon: const Text(""),
                  hintText: "Enter your email",
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                    text: "SEND EMAIL",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.resetPassword(
                            email: emailController.text.trim());
                      }
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
