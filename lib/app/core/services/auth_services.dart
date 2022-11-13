import 'package:fwc_2022/app/core/services/google_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/constants.dart';

class AuthService {
  AuthService._();

  static void logout() {
    GetStorage().remove(Constants.USER_TOKEN);
    GoogleSignInAPI.logout();
    Get.offNamed(Constants.SIGNIN);
  }

  static String? getUserAccessToken() => GetStorage().read(
        Constants.USER_TOKEN,
      );
}
