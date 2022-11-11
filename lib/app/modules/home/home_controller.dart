import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/constants.dart';
import '../new_bet/new_bet-binding.dart';
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

    return null;
  }
}
