import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/services/network/category_serices.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var categoryList = <ProductsModel>[].obs;
  var isLoading = false.obs;

  List<String> categoryImage = [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg",
    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategory(String category) async {
    isLoading(true);
    categoryList.value = await AllCategoryServices.getAllCategory(category);
    isLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryName = await getAllCategory(categoryNameList[index]);
    if (categoryName.isNotEmpty) {
      categoryList.value = categoryName;
    }
  }
}
