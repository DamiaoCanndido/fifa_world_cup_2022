import 'package:get/get.dart';
import 'guess_create_controller.dart';

class GuessCreateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuessCreateController());
  }
}
