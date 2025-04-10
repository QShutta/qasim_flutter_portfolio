import 'package:get/instance_manager.dart';
import 'package:qasim_profile_info/controller/home_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    print("--------------------------------------------");
    Get.put(HomeController());
    print("--------------------------------------------");
  }
}
