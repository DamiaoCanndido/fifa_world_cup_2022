import 'package:get/get.dart';
import '../modules/guess/guess_binding.dart';
import '../core/constants/constants.dart';
import '../modules/guess/guess_page.dart';
import '../modules/guess_create/guess_create_binding.dart';
import '../modules/guess_create/guess_create_page.dart';

class GuessRouters {
  GuessRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.GUESS,
      page: () => const GuessPage(),
      binding: GuessBinding(),
    ),
    GetPage(
      name: Constants.GUESS_CREATE,
      page: () => const GuessCreate(),
      binding: GuessCreateBinding(),
    )
  ];
}
