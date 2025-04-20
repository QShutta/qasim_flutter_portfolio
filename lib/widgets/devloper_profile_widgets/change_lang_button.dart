import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/dev_info_controller.dart';
import 'package:qasim_profile_info/services/settings_services.dart';

class ChangeLangButton extends StatelessWidget {
  ChangeLangButton({super.key});
  final DevInfoController devCont = Get.find();
  final SettingsServices settingsServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // استرجاع اللغة الحالية المحفوظة في
        // SharedPreferences
        // إذا لم تكن هناك لغة محفوظة، سيتم تعيين
        //"en"
        //(الإنجليزية) كافتراضية
        String currentLang =
            settingsServices.sharePref?.getString("lang") ?? "en";

        // التحقق من اللغة الحالية وتحديد اللغة الجديدة
        // إذا كانت اللغة الحالية
        //"ar"
        // (العربية)، سيتم تغييرها إلى
        //"en"
        // (الإنجليزية)
        // وإذا كانت
        //"en"،
        // سيتم تغييرها إلى
        // "ar"
        String newLang = (currentLang == "ar") ? "en" : "ar";

        // استدعاء الدالة المسؤولة عن تغيير اللغة وتحديث التطبيق
        // myLocalController.changeLang(newLang);
        devCont.changeLang(newLang);
      },
      icon: Icon(Icons.language),
    );
  }
}
