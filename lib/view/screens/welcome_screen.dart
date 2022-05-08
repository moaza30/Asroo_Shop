import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: 190,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextUtils(
                        underLine: TextDecoration.none,
                        text: 'Welcome',
                        fontSize: 25,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 190,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          underLine: TextDecoration.none,
                          text: "Astro",
                          fontSize: 20,
                          textColor: mainColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        TextUtils(
                          underLine: TextDecoration.none,
                          text: "Shop",
                          fontSize: 20,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get.to(LoginScreen());
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      underLine: TextDecoration.none,
                      fontSize: 20,
                      text: "Get started",
                      textColor: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        underLine: TextDecoration.none,
                        text: "Don't have an account ? ",
                        fontSize: 15,
                        textColor: Colors.white,
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.signupScreen);
                        },
                        child: TextUtils(
                          underLine: TextDecoration.underline,
                          text: " Sign up",
                          fontSize: 15,
                          textColor: mainColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
