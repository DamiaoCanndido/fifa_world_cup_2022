import 'package:flutter/material.dart';
import 'package:fwc_2022/app/core/constants/constants.dart';
import 'package:fwc_2022/app/core/ui/widgets/get_detail.dart';
import 'package:get/get.dart';
import '../../core/ui/widgets/fwc_button.dart';

class MyBetPage extends StatelessWidget {
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
          Container(
            margin: const EdgeInsets.only(top: 70),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GetDetail(
                  getName: 'Fifa World Cup',
                  createdBy: 'Nergal',
                  picture:
                      "https://upload.wikimedia.org/wikipedia/pt/3/31/Spain_National_Football_Team_badge.png",
                  navigate: () {
                    Get.toNamed(Constants.GUESS);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
