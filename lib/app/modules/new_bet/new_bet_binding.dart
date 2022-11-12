import 'package:get/get.dart';
import 'new_bet_controller.dart';

class NewBetBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NewBetController());
  }
}
