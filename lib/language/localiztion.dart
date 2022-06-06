import 'package:e_commerce/language/ar.dart';
import 'package:e_commerce/language/fr.dart';
import 'package:get/get.dart';
import '../utils/strings.dart';
import 'package:get/route_manager.dart';
import 'package:e_commerce/language/english.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        en: english,
        ar: arabic,
        fr: french,
      };
}
