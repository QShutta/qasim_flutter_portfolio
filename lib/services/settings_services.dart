import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsServices extends GetxService {
  SharedPreferences? sharePref;
  bool isLogin = false;
  Future<SettingsServices> init() async {
    sharePref = await SharedPreferences.getInstance();
    return this;
  }
}
