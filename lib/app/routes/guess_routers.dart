import 'package:get/get.dart';
import '../core/constants/constants.dart';
import '../modules/guess/guess_binding.dart';
import '../modules/guess/guess_page.dart';

class GuessRouters {
  GuessRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.GUESS,
      page: () => const GuessPage(),
      binding: GuessBinding(),
    )
  ];
}
