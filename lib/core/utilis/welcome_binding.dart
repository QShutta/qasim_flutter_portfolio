import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/welcome_contrlloer.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeContrlloer>(() => WelcomeContrlloer());
  }
}
