import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductInfo extends StatelessWidget {
  final String title, description;
  final double rate;
  final int productId;
  ProductInfo({
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
  });

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              Obx(
                () {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white
                          : Colors.grey.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.manageFavourites(productId);
                      },
                      child: controller.isFavourites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                              size: 20,
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: rate.toString(),
                fontSize: 14,
                textColor: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              const SizedBox(width: 8),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: const TextStyle(
              color: mainColor,
            ),
            lessStyle: const TextStyle(
              color: mainColor,
            ),
            style: TextStyle(
              fontSize: 15,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
