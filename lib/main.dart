import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fwc_2022/app/core/bindings/application_bindings.dart';
import 'package:fwc_2022/app/routes/auth_routers.dart';
import 'package:fwc_2022/app/routes/find_routers.dart';
import 'package:fwc_2022/app/routes/guess_routers.dart';
import 'package:fwc_2022/app/routes/home_routers.dart';
import 'package:fwc_2022/app/routes/splash_router.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/core/ui/fwc_ui.dart';

Future<void> main() async {
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  runApp(const FWCMainApp());
}

class FWCMainApp extends StatelessWidget {
  const FWCMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fifa World Cup",
      theme: FWCUI.theme,
      initialBinding: ApplicationBinding(),
      debugShowCheckedModeBanner: false,
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...FindRouters.routers,
        ...GuessRouters.routers,
      ],
    );
  }
}
