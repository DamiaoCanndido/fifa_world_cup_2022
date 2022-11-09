import 'package:fwc_2022/app/modules/signin/signin_controller.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => SignInController());
  }
}
