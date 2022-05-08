import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/logic/controller/auth_controller.dart';
import '/routes/routes.dart';
import '/utils/strings.dart';
import '/utils/theme.dart';
import '../../widgets/auth_widgets/auth_button.dart';
import '../../widgets/auth_widgets/auth_form_field.dart';
import '../../widgets/auth_widgets/bottom_container.dart';
import '../../widgets/auth_widgets/check_box.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
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
                                text: "LOG",
                                fontSize: 28,
                                textColor: mainColor,
                                underLine: TextDecoration.none),
                            const SizedBox(
                              width: 5,
                            ),
                            TextUtils(
                                text: "IN",
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgetPasswordScreen);
                            },
                            child: TextUtils(
                                text: "Forgot password?",
                                fontSize: 15,
                                textColor: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                underLine: TextDecoration.none),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: "SIGN IN",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.logIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                          text: "OR",
                          fontSize: 15,
                          textColor:
                              Get.isDarkMode ? Colors.white : Colors.black,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.googleSignIn();
                                },
                                child: Image.asset("assets/images/google.png"),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                  text1: "Don't have an account ",
                  text2: "Sign up",
                  onPressed: () {
                    Get.offNamed(Routes.signupScreen);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
