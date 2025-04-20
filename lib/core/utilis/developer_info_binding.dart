import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/dev_info_controller.dart';

class DevInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DevInfoController());
  }
}
