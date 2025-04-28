import 'dart:ui';

import 'package:get/get.dart';
import 'package:qasim_profile_info/core/themes/themes.dart';

import 'package:qasim_profile_info/services/settings_services.dart';

class DevInfoController extends GetxController {
  var count1 = 0.obs; // تعريف متغير ملاحظ (Observable) لتتبع عدد معين
  final SettingsServices settingsServices = Get.find<SettingsServices>();
  // تعريف متغير
  //isDark
  // لمراقبة حالة الثيم (مظلم أو فاتح)
  late RxBool isDark;
  late Locale initalLang;
  @override
  void onInit() {
    super.onInit();

    // متغير لتحديد اللغة الافتراضية للتطبيق
    initalLang =
        settingsServices.sharePref!.getString("lang") ==
                null // التحقق مما إذا كان هناك لغة محفوظة في التخزين المحلي
            ? Get
                .deviceLocale! // إذا لم تكن هناك لغة محفوظة، يتم استخدام لغة الجهاز الافتراضية
            : Locale(
              "${settingsServices.sharePref!.getString("lang")}",
            ); // إذا كانت هناك لغة محفوظة، يتم استرجاعها واستخدامها

    isDark = (settingsServices.sharePref?.getBool("dark") ?? false).obs;
  }

  // changeTheme: دالة تقوم بتغيير الثيم بين الوضع الفاتح والمظلم
  changeTheme() {
    isDark.value = !isDark.value; // تبديل قيمة isDark بين true و false

    // تحديث الثيم في التطبيق بناءً على قيمة isDark
    Get.changeTheme(isDark.value ? Thems.darkTheme : Thems.lightTheme);

    // حفظ الحالة الجديدة في
    //SharedPreferences
    //لضمان الاحتفاظ بالثيم بعد إعادة تشغيل التطبيق
    settingsServices.sharePref!.setBool("dark", isDark.value);
  }

  // inc1: دالة لزيادة قيمة count1
  inc1() {
    count1.value++; // زيادة المتغير بمقدار 1
  }

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    settingsServices.sharePref!.setString("lang", langCode);
    Get.updateLocale(locale);
  }
}
