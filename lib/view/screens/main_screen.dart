import 'package:badges/badges.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/main_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              elevation: 0,
              title: Text(controller.title[controller.currentIndex.value].tr),
              centerTitle: true,
              actions: [
                Obx(() {
                  return Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.cartScreen);
                        },
                        icon: Image.asset("assets/images/shop.png")),
                  );
                }),
              ],
            ),

            // Screen Body
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.screens.value,
            ),

            //Bottom nav bar
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                controller.currentIndex.value = index;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                  activeIcon: const Icon(
                    Icons.home,
                    color: mainColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                  activeIcon: const Icon(
                    Icons.category,
                    color: mainColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                  activeIcon: const Icon(
                    Icons.favorite,
                    color: mainColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                  activeIcon: const Icon(
                    Icons.settings,
                    color: mainColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
