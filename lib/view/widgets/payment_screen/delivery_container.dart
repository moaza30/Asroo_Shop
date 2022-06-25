import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/payment_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColor = false;

  final TextEditingController phoneController = TextEditingController();
  final paymentController = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          title: "Asroo Shop",
          name: "Asroo Shop",
          phone: "0112345678",
          address: "Egypt, Giza",
          value: 1,
          icon: Container(),
          color: changeColor ? Colors.white : Colors.grey.shade300,
          onChange: (int? value) {
            setState(() {
              radioContainerIndex = value!;
              changeColor = !changeColor;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => buildRadioContainer(
            title: "Delivery".tr,
            name: authController.displayName.value,
            phone: paymentController.phoneNumber.value,
            address: paymentController.address.value,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: "Phone".tr,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  radius: 10,
                  textCancel: "Cancel".tr,
                  cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
                  textConfirm: "Save".tr,
                  confirmTextColor: Colors.black,
                  onCancel: () {
                    Get.toNamed(Routes.paymentScreen);
                  },
                  onConfirm: () {
                    Get.back();
                    paymentController.phoneNumber.value = phoneController.text;
                  },
                  buttonColor: mainColor,

                  // Enter phone Number field

                  content: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: phoneController,
                      maxLength: 11,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      onSubmitted: (String value) {
                        phoneController.text = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Phone".tr,
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w400,
                        ),
                        fillColor: Get.isDarkMode
                            ? Colors.white
                            : mainColor.withOpacity(0.2),
                        focusColor: Colors.black,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            phoneController.clear();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.contact_phone,
                size: 20,
                color: mainColor,
              ),
            ),
            value: 2,
            color: changeColor ? Colors.grey.shade300 : Colors.white,
            onChange: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
              paymentController.updatePosition();
            },
          ),
        ),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChange,
    required String title,
    required String name,
    required String address,
    required String phone,
    required Widget icon,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  fontSize: 20,
                  textColor: Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: name,
                  fontSize: 15,
                  textColor: Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text(
                      "🇪🇬+2 ",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    TextUtils(
                      text: phone,
                      fontSize: 15,
                      textColor: Colors.black,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(width: 120),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: address,
                  fontSize: 15,
                  textColor: Colors.black,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
