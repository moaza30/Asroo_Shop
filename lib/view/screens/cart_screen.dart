import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';
import '../widgets/cart/porduct_card.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Cart Items"),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.backspace),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductCard();
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CartTotal(),
                ),
              ],
            ),
          )),
    );
  }
}
