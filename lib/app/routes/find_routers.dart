import 'package:get/get.dart';
import '../core/constants/constants.dart';
import '../modules/find/find_binding.dart';
import '../modules/find/find_page.dart';

class FindRouters {
  FindRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.FIND,
      page: () => const FindPage(),
      binding: FindBinding(),
    )
  ];
}
