import 'package:flutter/material.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_appbar.dart';
import 'package:fwc_2022/app/core/ui/widgets/get_detail.dart';

class GuessPage extends StatelessWidget {
  const GuessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FWCAppBar(
        centerTitle: true,
        title: const Text("Bolão"),
      ),
      body: Column(
        children: [
          const GetDetail(
            getName: "Bolao",
            createdBy: "Nergal",
            picture:
                "https://upload.wikimedia.org/wikipedia/pt/3/31/Spain_National_Football_Team_badge.png",
          ),
          Container(
            color: Colors.pink,
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      debugPrint("1");
                    },
                    child: Container(
                      height: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      debugPrint("2");
                    },
                    child: Container(
                      height: 40,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
