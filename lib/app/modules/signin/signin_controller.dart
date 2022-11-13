import 'package:flutter/cupertino.dart';
import 'package:fwc_2022/app/core/constants/constants.dart';
import 'package:fwc_2022/app/core/services/google_services.dart';
import 'package:fwc_2022/app/core/ui/mixins/loader.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with LoaderMixin {
  final _loading = false.obs;

  @override
  void onInit() {
    loaderListener(_loading);
    super.onInit();
  }

  Future<void> signIn() async {
    final user = await GoogleSignInAPI.login();
    debugPrint(user!.id);

    Get.offNamed(Constants.HOME);
  }
}
