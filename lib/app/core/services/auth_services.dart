import 'package:fwc_2022/app/core/services/google_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/constants.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    // logout();
    _getStorage.listenKey(Constants.USER_TOKEN, (value) {
      _isLogged(value != null);
    });

    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed(Constants.SIGNIN);
      } else {
        Get.offAllNamed(Constants.HOME);
      }
    });

    _isLogged(getUserAccessToken() != null);

    return this;
  }

  void logout() {
    GoogleSignInAPI.logout();
    _getStorage.remove(Constants.USER_TOKEN);
  }

  String? getUserAccessToken() => _getStorage.read(Constants.USER_TOKEN);
}
