import 'package:fwc_2022/app/modules/new_bet/new_bet_controller.dart';
import 'package:get/get.dart';

class NewBetBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NewBetController());
  }
}
