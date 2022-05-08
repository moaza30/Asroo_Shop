import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../../utils/strings.dart';
import '../../widgets/auth_widgets/auth_button.dart';
import '../../widgets/auth_widgets/auth_form_field.dart';
import '../../widgets/auth_widgets/bottom_container.dart';
import '../../widgets/auth_widgets/check_box.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                text: "SIGN",
                                fontSize: 28,
                                textColor: mainColor,
                                underLine: TextDecoration.none),
                            const SizedBox(
                              width: 5,
                            ),
                            TextUtils(
                                text: "UP",
                                fontSize: 28,
                                textColor: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                underLine: TextDecoration.none),
                          ],
                        ),
                        const SizedBox(height: 50),
                        AuthTextFormField(
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return "Enter valid name";
                            } else {
                              return null;
                            }
                          },
                          controller: nameController,
                          hideText: false,
                          prefixIcon: Image.asset("assets/images/user.png"),
                          suffixIcon: const Text(""),
                          hintText: "User Name",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AuthTextFormField(
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return "Enter valid email";
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          hideText: false,
                          prefixIcon: Image.asset("assets/images/email.png"),
                          suffixIcon: const Text(""),
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                            validator: (value) {
                              if (value.toString().length < 8) {
                                return "Please enter at least 8 characters";
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            hideText: controller.isVisibility,
                            prefixIcon: Image.asset("assets/images/lock.png"),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                            ),
                            hintText: "Password",
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        CheckWidget(),
                        /////////////////////////////////////////////////
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: "SIGN UP",
                            onPressed: () {
                              if (controller.isChecked == false) {
                                Get.snackbar(
                                  "Attention!",
                                  "Please accept terms & conditions after you read them.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              } else if (formKey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password =
                                    passwordController.text.trim();
                                controller.signUp(
                                  name: name,
                                  email: email,
                                  password: password,
                                );

                                controller.isChecked = true;
                              }
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                  text1: "Already have an account? ",
                  text2: "Log in",
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
