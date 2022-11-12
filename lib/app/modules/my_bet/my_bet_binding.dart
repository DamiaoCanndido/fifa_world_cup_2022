import 'package:fwc_2022/app/modules/my_bet/my_bet_controller.dart';
import 'package:get/get.dart';

class MyBetBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyBetController());
  }
}
