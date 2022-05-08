import 'package:e_commerce/utils/strings.dart';
import 'package:http/http.dart' as http;
import '../../model/product_model.dart';

class ProductServices {
  static Future<List<ProductsModel>> getProduct() async {
    var response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productsModelFromJson(jsonData);
    } else {
      return throw Exception("Error has occurred, please try again later");
    }
  }
}
