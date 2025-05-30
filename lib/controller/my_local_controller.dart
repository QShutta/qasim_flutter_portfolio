import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/services/settings_services.dart';

//حاليا كدة ما شاي ففي داعي للكنترولر دي شايف من الافضل نشيل الكودالجواها يا زول ونختو في ال
//devInfo controller
//ونقرض علي كدة .
class MyLocalController extends GetxController {
  final SettingsServices settingsServices = Get.find<SettingsServices>();
  // متغير لتحديد اللغة الافتراضية للتطبيق
  late Locale initalLang;

  @override
  void onInit() {
    super.onInit();
    initalLang =
        settingsServices.sharePref!.getString("lang") ==
                null // التحقق مما إذا كان هناك لغة محفوظة في التخزين المحلي
            ? Get
                .deviceLocale! // إذا لم تكن هناك لغة محفوظة، يتم استخدام لغة الجهاز الافتراضية
            : Locale(
              "${settingsServices.sharePref!.getString("lang")}",
            ); // إذا كانت هناك لغة محفوظة، يتم استرجاعها واستخدامها
  }

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    settingsServices.sharePref!.setString("lang", langCode);
    Get.updateLocale(locale);
  }
}
