import 'package:get/get.dart';
import '../core/constants/constants.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    )
  ];
}
