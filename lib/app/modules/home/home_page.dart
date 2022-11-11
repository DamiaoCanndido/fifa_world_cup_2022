import 'package:flutter/material.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_appbar.dart';
import 'package:fwc_2022/app/modules/home/home_controller.dart';
import 'package:get/get.dart';
import '../../core/constants/constants.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FWCAppBar(
        centerTitle: true,
        title: const Text("BOLÃO"),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shield_outlined),
              label: "Ligas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield_rounded),
              label: "Minhas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: "Sair",
            ),
          ],
          onTap: (value) {
            controller.setTabIndex = value;
          },
          currentIndex: controller.tabIndex,
        ),
      ),
      body: Navigator(
        initialRoute: Constants.NEW,
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGenerateRouter,
      ),
    );
  }
}
