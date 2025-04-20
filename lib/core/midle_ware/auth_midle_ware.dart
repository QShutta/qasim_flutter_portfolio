import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/services/settings_services.dart';

class AuthMidleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final SettingsServices settingsServices = Get.find();
    if (settingsServices.sharePref!.getString("id") != null) {
      return RouteSettings(name: "/DevInfo");
    }
    return null;
  }
}
