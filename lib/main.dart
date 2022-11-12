import 'package:flutter/material.dart';
import 'package:fwc_2022/app/routes/auth_routers.dart';
import 'package:fwc_2022/app/routes/home_routers.dart';
import 'package:get/get.dart';
import 'app/core/ui/fwc_ui.dart';

void main() {
  runApp(const FWCMainApp());
}

class FWCMainApp extends StatelessWidget {
  const FWCMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fifa World Cup",
      theme: FWCUI.theme,
      debugShowCheckedModeBanner: false,
      getPages: [
        ...AuthRouters.routers,
        ...HomeRouters.routers,
      ],
    );
  }
}
