import 'package:flutter/material.dart';

class GetDetail extends StatelessWidget {
  const GetDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 80,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Bolão de exemplo",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Criado por Nergal",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ]),
          ),
          Container(
            color: Colors.black,
            height: 80,
            width: 200,
            child: Center(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                primary: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/pt/3/31/Spain_National_Football_Team_badge.png",
                        fit: BoxFit.contain,
                        width: 70,
                        height: 70,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
