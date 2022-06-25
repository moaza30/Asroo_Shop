import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/payment_screen/delivery_container.dart';
import '../widgets/payment_screen/payment_method.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment".tr),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
                text: "Shipping to".tr,
                fontSize: 24,
                textColor: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none),
            const SizedBox(height: 20),
            DeliveryContainerWidget(),
            const SizedBox(height: 20),
            TextUtils(
                text: "Payment Method".tr,
                fontSize: 22,
                textColor: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none),
            const SizedBox(height: 20),
            PaymentMethodWidget(),
            const SizedBox(height: 30),
            Center(
              child: TextUtils(
                text: "Total \$200",
                fontSize: 20,
                textColor: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.height * 0.14,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: mainColor,
                  ),
                  child: Text(
                    "Pay Now".tr,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            // TotalButton(),
          ],
        ),
      ),
    );
  }
}
