import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../widgets/home_screen/card_items.dart';
import '../widgets/home_screen/search_form_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        text: "Find Your",
                        fontSize: 20,
                        textColor: Colors.white,
                        underLine: TextDecoration.none),
                    TextUtils(
                        text: "INSPIRATION",
                        fontSize: 25,
                        textColor: Colors.white,
                        underLine: TextDecoration.none),
                    const SizedBox(height: 20),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                    text: "Categories",
                    fontSize: 20,
                    textColor: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
