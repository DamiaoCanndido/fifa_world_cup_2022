import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:fwc_2022/app/core/constants/constants.dart';
import 'package:fwc_2022/app/core/services/google_services.dart';
import 'package:fwc_2022/app/core/ui/mixins/loader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/rest_client/rest_client.dart';
import '../../repository/auth/auth_repository.dart';

class SignInController extends GetxController with LoaderMixin {
  final AuthRepository _authRepository;

  SignInController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final _loading = false.obs;

  @override
  void onInit() {
    loaderListener(_loading);
    super.onInit();
  }

  Future<void> signIn() async {
    try {
      final user = await GoogleSignInAPI.login();

      final token = await GoogleSignInAPI.getAccessToken(user);
      debugPrint(token);

      _loading.toggle();
      final userLogged = await _authRepository.signin(token);

      final storage = GetStorage();
      storage.write(Constants.USER_TOKEN, userLogged.token);

      _loading.toggle();
      Get.offNamed(Constants.HOME);
    } on RestClientException catch (e, s) {
      log(e.message, error: e, stackTrace: s);
    } catch (e, s) {
      log("Erro ao logar no google", error: e, stackTrace: s);
    }
  }
}
