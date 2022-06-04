import 'package:e_commerce/utils/strings.dart';
import 'package:http/http.dart' as http;
import '../../model/category_model.dart';
import '../../model/product_model.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse("$baseUrl/products/categories"));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception("Error has occurred, please try again later");
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductsModel>> getAllCategory(String category) async {
    var response =
        await http.get(Uri.parse("$baseUrl/products/category/$category"));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productsModelFromJson(jsonData);
    } else {
      return throw Exception("Error has occurred, please try again later");
    }
  }
}
