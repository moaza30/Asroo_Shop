import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/services/network/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductsModel>[].obs;
  var favouritesList = <ProductsModel>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  // provided by GetX
  @override
  void onInit() {
    super.onInit();
    // Add List to Get Storage
    List? storedProducts = storage.read<List>('isFavouritesList');
    if (storedProducts != null) {
      favouritesList =
          storedProducts.map((e) => ProductsModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      // isLoading.value = true
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Favourite products logic
  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await storage.remove("isFavouritesList");
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));

      await storage.write("isFavouritesList", favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }
}
