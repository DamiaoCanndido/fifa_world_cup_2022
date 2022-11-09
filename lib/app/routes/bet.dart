import 'package:fwc_2022/app/modules/new_bet/new_bet-binding.dart';
import 'package:fwc_2022/app/modules/new_bet/new_bet_page.dart';
import 'package:get/get.dart';
import '../core/constants/constants.dart';

class BetRouters {
  BetRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.NEW,
      page: () => const NewBetPage(),
      binding: NewBetBinding(),
    )
  ];
}
