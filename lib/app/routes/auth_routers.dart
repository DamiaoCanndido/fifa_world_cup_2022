import 'package:get/get.dart';
import '../core/constants/constants.dart';
import '../modules/signin/signin_binding.dart';
import '../modules/signin/signin_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.SIGNIN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    )
  ];
}
