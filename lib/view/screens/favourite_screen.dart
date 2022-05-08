import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favouritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/images/heart.png",
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                TextUtils(
                    text: "Please, Add your favourite products",
                    fontSize: 18,
                    textColor: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none),
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return buildFavouriteItems(
                productImage: controller.favouritesList[index].image,
                title: controller.favouritesList[index].title,
                price: controller.favouritesList[index].price,
                productId: controller.favouritesList[index].id,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
                thickness: 1,
              );
            },
            itemCount: controller.favouritesList.length,
          );
        }
      }),
    );
  }

  Widget buildFavouriteItems({
    required String productImage,
    required String title,
    required double price,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    productImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      fontSize: 18,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Price: \$$price",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 15,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.manageFavourites(productId);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
