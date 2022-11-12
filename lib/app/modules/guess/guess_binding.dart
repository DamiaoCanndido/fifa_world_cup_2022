import 'package:get/get.dart';
import 'guess_controller.dart';

class GuessBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GuessController());
  }
}
