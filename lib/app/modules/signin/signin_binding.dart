import 'package:fwc_2022/app/modules/signin/signin_controller.dart';
import 'package:get/get.dart';
import '../../repository/auth/auth_repository.dart';
import '../../repository/auth/auth_repository_impl.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => SignInController(
        authRepository: Get.find(),
      ),
    );
  }
}
