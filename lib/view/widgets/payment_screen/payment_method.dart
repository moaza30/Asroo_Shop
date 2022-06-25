import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodWidget extends StatefulWidget {
  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  // set Radio starter
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
              text: "PayPal",
              image: "assets/images/paypal.png",
              scale: 0.7,
              value: 1,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          const SizedBox(height: 15),
          buildRadioPayment(
              text: "Google Pay",
              image: "assets/images/google.png",
              scale: 0.9,
              value: 2,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          const SizedBox(height: 15),
          buildRadioPayment(
              text: "Credit Card",
              image: "assets/images/credit.png",
              scale: 0.8,
              value: 3,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required String text,
    required double scale,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(width: 10),
              TextUtils(
                  text: text,
                  fontSize: 22,
                  textColor: Colors.black,
                  underLine: TextDecoration.none),
            ],
          ),
          Radio(
            value: value,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            groupValue: radioPaymentIndex,
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
