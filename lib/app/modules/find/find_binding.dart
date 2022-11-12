import 'package:fwc_2022/app/modules/find/find_controller.dart';
import 'package:get/get.dart';

class FindBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FindController());
  }
}
