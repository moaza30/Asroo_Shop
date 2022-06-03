import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductsModel productsModel) {
    if (productMap.containsKey(productsModel)) {
      productMap[productsModel] += 1;
    } else {
      productMap[productsModel] = 1;
    }
  }

  void removeProductFromCart(ProductsModel productsModel) {
    if (productMap.containsKey(productsModel) &&
        productMap[productsModel] == 1) {
      productMap.removeWhere((key, value) => key == productsModel);
    } else {
      productMap[productsModel] -= 1;
    }
  }

  void removeOneProduct(ProductsModel productsModel) {
    productMap.removeWhere((key, value) => key == productsModel);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Remove Products",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      middleText: "Are sure to Remove All Products",
      textCancel: " No ",
      cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      textConfirm: " Yes ",
      confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? Colors.red : mainColor,
    );
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();
  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  // Product quantity in MainScreen
  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
