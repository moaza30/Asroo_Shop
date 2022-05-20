import 'package:e_commerce/view/screens/auth/forget_password.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/signup_screen.dart';
import 'package:e_commerce/view/screens/cart_screen.dart';
import 'package:e_commerce/view/screens/main_screen.dart';
import 'package:get/get.dart';
import '/logic/bindings/auth_bindung.dart';
import '/logic/bindings/main_binding.dart';
import '/logic/bindings/product_binding.dart';
import '/view/screens/welcome_screen.dart';

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = "/mainScreen";
  static const cartScreen = "/cartScreen";
}

class AppRoutes {
  // initial route
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  // get page
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        ProductBinding(),
        AuthBinding(),
      ],
    ),
  ];
}
