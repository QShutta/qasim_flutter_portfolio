import 'package:get/instance_manager.dart';
import 'package:qasim_profile_info/controller/dev_info_controller.dart';
import 'package:qasim_profile_info/controller/home_controller.dart';
import 'package:qasim_profile_info/controller/my_local_controller.dart';
import 'package:qasim_profile_info/controller/sign_in_controller.dart';
import 'package:qasim_profile_info/controller/sign_up_controller.dart';
import 'package:qasim_profile_info/controller/welcome_contrlloer.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(WelcomeContrlloer());
    Get.put(MyLocalController());
    Get.put(SignInController());
    Get.put(DevInfoController());
    Get.put(SignUpController());
  }
}
