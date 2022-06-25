import 'package:e_commerce/utils/strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var languageLocale = en;

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  // Change Application Language

  @override
  void onInit() async {
    super.onInit();
    languageLocale = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  Future<String> get getLanguage async {
    return await storage.read("lang");
  }

  void changeLanguage(String type) {
    saveLanguage(type);
    if (languageLocale == type) {
      return null;
    }
    if (type == fr) {
      languageLocale = fr;
      saveLanguage(fr);
    } else if (type == ar) {
      languageLocale = ar;
      saveLanguage(ar);
    } else {
      languageLocale = en;
      saveLanguage(en);
    }
    update();
  }
}
