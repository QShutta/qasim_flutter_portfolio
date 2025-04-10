import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/main.dart';

class AuthMidleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharePref!.getString("id") != null) {
      return RouteSettings(name: "/DevInfo");
    }
    return null;
  }
}
