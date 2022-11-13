import 'package:fwc_2022/app/core/services/auth_services.dart';
import 'package:fwc_2022/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
