import 'package:flutter/material.dart';
import 'package:fwc_2022/app/core/constants/constants.dart';
import 'package:fwc_2022/app/core/ui/widgets/get_detail.dart';
import 'package:fwc_2022/app/modules/my_bet/my_bet_controller.dart';
import 'package:get/get.dart';
import '../../core/ui/widgets/fwc_button.dart';

class MyBetPage extends GetView<MyBetController> {
  const MyBetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FWCButton(
              label: "BUSCAR BOLÃO POR CÓDIGO",
              onPressed: () {
                Get.toNamed(Constants.FIND);
              },
              width: double.infinity,
            ),
          ),
          Obx(
            () => controller.bets.isEmpty
                ? Container(
                    margin: const EdgeInsets.only(top: 70),
                    child: const Text(
                      "Nenhum bolão",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 70),
                    child: Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.bets.length,
                        itemBuilder: (context, index) {
                          final myBets = controller.bets[index];
                          return GetDetail(
                            betModel: myBets,
                            navigate: () {
                              Get.toNamed(
                                Constants.GUESS,
                                arguments: {"betModel": myBets},
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
