import 'package:e_commerce/model/product_model.dart';
import 'package:get/get.dart';

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
    productMap.clear();
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();
  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
