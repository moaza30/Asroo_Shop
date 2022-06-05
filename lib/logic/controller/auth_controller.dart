import 'package:e_commerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../routes/routes.dart';

class AuthController extends GetxController {
  bool isVisibility = true;
  bool isChecked = false;
  var displayName = "".obs;
  var userPhoto = "".obs;
  var displayEmail = "".obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSign = GoogleSignIn();
  String key = "auth";
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  User? get userProfile => auth.currentUser!;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    displayName.value = userProfile != null ? userProfile!.displayName! : "";
    displayEmail.value = userProfile != null ? userProfile!.email! : "";
  }

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isChecked = !isChecked;
    update();
  }

// Sign Up with FireBase function
  void signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName.value = name;
        auth.currentUser?.updateDisplayName(name);
      });
      update();

      Get.offNamed(Routes.mainScreen);
      // this part about Firebase errors
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = "";
      if (e.code == 'weak-password') {
        message =
            'The password provided is too weak, please enter at least 8 characters.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      /*   */
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

// Sign in with Firebase Function
  void logIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isSignedIn = true;
      authBox.write(key, isSignedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = "";

      if (e.code == 'user-not-found') {
        message = 'No user found for that email: $email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Reset user's Password function with FireBase
  void resetPassword({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
    // update() same as notify listener in provider
    update();
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: mainColor,
      colorText: Colors.white,
    );
  }

  // Sign in with Google using FireBase
  void googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSign.signIn();
      displayName.value = googleUser!.displayName!;
      userPhoto.value = googleUser.photoUrl!;
      displayEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write(key, isSignedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Sign in with Facebook using FireBase
  void facebookSignIn() {}

  // Sign Out function with FireBase
  void signOut() async {
    try {
      await auth.signOut();
      displayName.value = "";
      userPhoto.value = "";
      displayEmail.value = "";
      isSignedIn = false;
      authBox.remove(key);

      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
