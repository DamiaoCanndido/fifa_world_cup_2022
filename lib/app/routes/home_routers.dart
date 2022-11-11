import 'package:get/get.dart';
import '../core/constants/constants.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    )
  ];
}
