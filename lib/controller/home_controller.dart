import 'package:get/get.dart'; // استيراد مكتبة GetX لإدارة الحالة
import 'package:qasim_profile_info/core/themes/themes.dart';
import 'package:qasim_profile_info/services/settings_services.dart'; // استيراد ملف main.dart لاستخدام المتغيرات المشتركة مثل sharePref

class HomeController extends GetxController {
  var count1 = 0.obs; // تعريف متغير ملاحظ (Observable) لتتبع عدد معين

  final SettingsServices settingsServices = Get.find<SettingsServices>();
  // تعريف متغير
  //isDark
  // لمراقبة حالة الثيم (مظلم أو فاتح)
  late RxBool isDark;

  @override
  void onInit() {
    super.onInit();
    isDark = (settingsServices.sharePref?.getBool("dark") ?? false).obs;
  }

  // changeTheme: دالة تقوم بتغيير الثيم بين الوضع الفاتح والمظلم
  changeTheme() {
    isDark.value = !isDark.value; // تبديل قيمة isDark بين true و false

    // تحديث الثيم في التطبيق بناءً على قيمة isDark
    Get.changeTheme(isDark.value ? Thems.darkTheme : Thems.lightTheme);

    // حفظ الحالة الجديدة في SharedPreferences لضمان الاحتفاظ بالثيم بعد إعادة تشغيل التطبيق
    settingsServices.sharePref!.setBool("dark", isDark.value);
  }

  // inc1: دالة لزيادة قيمة count1
  inc1() {
    count1.value++; // زيادة المتغير بمقدار 1
  }
}
