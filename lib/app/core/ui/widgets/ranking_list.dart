import 'package:flutter/material.dart';

class RankingList extends StatelessWidget {
  const RankingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: ListView.builder(
        primary: true,
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 49, 48, 48),
            height: 100,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(16),
                  child: CircleAvatar(
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/pt/3/31/Spain_National_Football_Team_badge.png",
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Nergal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "10 ponto(s)",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Container(
                      height: 35,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "1°",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
