import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/constants.dart';
import '../../core/services/google_services.dart';
import '../my_bet/my_bet_binding.dart';
import '../my_bet/my_bet_page.dart';
import '../new_bet/new_bet_binding.dart';
import '../new_bet/new_bet_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  final _tabs = [Constants.NEW, Constants.MY, Constants.LOGOUT];

  set setTabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == Constants.LOGOUT) {
      // Get.find<AuthService>().logout();
      // google disconnect
      GoogleSignInAPI.logout().then((value) => value);
      Get.offAllNamed(Constants.SIGNIN);
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGenerateRouter(RouteSettings settings) {
    if (settings.name == Constants.NEW) {
      return GetPageRoute(
        settings: settings,
        page: () => const NewBetPage(),
        binding: NewBetBinding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == Constants.MY) {
      return GetPageRoute(
        settings: settings,
        page: () => const MyBetPage(),
        binding: MyBetBinding(),
        transition: Transition.fadeIn,
      );
    }

    return null;
  }
}
