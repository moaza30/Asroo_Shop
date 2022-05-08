import 'package:e_commerce/view/screens/category_screen.dart';
import 'package:e_commerce/view/screens/favourite_screen.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:e_commerce/view/screens/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  // use obs cuz currentIndex value will change constantly
  RxInt currentIndex = 0.obs;

  final screens = [
    HomeScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingScreen(),
  ].obs;

  final title = [
    "Asroo Shop",
    "Category",
    "Favourites",
    "Settings",
  ].obs;
}
