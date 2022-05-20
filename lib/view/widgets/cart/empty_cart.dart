import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/routes/routes.dart';
import '../text_utils.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Your Cart is ",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: "Empty",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextUtils(
            text: "Add items to get Started",
            underLine: TextDecoration.none,
            fontSize: 18,
            textColor: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child: TextUtils(
                text: "Go to Home",
                textColor: Colors.white,
                underLine: TextDecoration.none,
                fontSize: 15,
              ),
              style: ElevatedButton.styleFrom(
                primary: mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
