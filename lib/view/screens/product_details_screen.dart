import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/product_details/Image_slider.dart';
import '../widgets/product_details/Product_info.dart';
import '../widgets/product_details/add_cart.dart';
import '../widgets/product_details/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductsModel productsModel;
  const ProductDetailsScreen({required this.productsModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(ImageUrl: productsModel.image),
              ProductInfo(
                title: productsModel.title,
                productId: productsModel.id,
                rate: productsModel.rating.rate,
                description: productsModel.description,
              ),
              SizeList(),
              AddCart(
                price: productsModel.price,
                productsModel: productsModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}
