import 'package:flutter/material.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_appbar.dart';
import 'package:fwc_2022/app/core/ui/widgets/get_detail.dart';
import 'package:fwc_2022/app/core/ui/widgets/guesses_list.dart';
import 'package:fwc_2022/app/core/ui/widgets/ranking_list.dart';
import 'package:fwc_2022/app/modules/guess/guess_controller.dart';
import 'package:get/get.dart';

class GuessPage extends GetView<GuessController> {
  const GuessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FWCAppBar(
        centerTitle: true,
        title: const Text("Bolão"),
      ),
      body: Obx(
        () => Stack(
          children: [
            const GetDetail(
              getName: "Bolao",
              createdBy: "Nergal",
              picture:
                  "https://upload.wikimedia.org/wikipedia/pt/3/31/Spain_National_Football_Team_badge.png",
            ),
            Container(
              color: const Color.fromARGB(255, 49, 48, 48),
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: controller.setActivePageGuess,
                      child: Container(
                        height: 40,
                        color: controller.activePage == "guesses"
                            ? const Color.fromARGB(255, 82, 81, 81)
                            : Colors.transparent,
                        child: Center(
                          child: Text(
                            "Meus palpites",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: controller.setActivePageRank,
                      child: Container(
                        height: 40,
                        color: controller.activePage == "ranking"
                            ? const Color.fromARGB(255, 82, 81, 81)
                            : Colors.transparent,
                        child: Center(
                          child: Text(
                            "Ranking do grupo",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            controller.activePage == "guesses"
                ? const GuessesList()
                : const RankingList()
          ],
        ),
      ),
    );
  }
}
