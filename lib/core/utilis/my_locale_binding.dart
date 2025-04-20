import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/my_local_controller.dart';

class MyLocaleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyLocalController());
  }
}
