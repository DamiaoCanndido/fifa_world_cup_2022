import 'package:flutter/material.dart';
import 'package:fwc_2022/app/models/bet_model.dart';

class BetDetail extends StatelessWidget {
  const BetDetail({
    super.key,
    this.navigate,
    required this.betModel,
  });

  final BetModel betModel;
  final VoidCallback? navigate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigate,
      child: Container(
        height: 80,
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 80,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        betModel.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "criado por: ${betModel.owner.name}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                    ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(16),
                color: Colors.black,
                height: 80,
                width: 200,
                child: Center(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    itemCount: betModel.participants.length,
                    itemBuilder: (context, index) {
                      final participants = betModel.participants[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: ClipOval(
                          child: Image.network(
                            isAntiAlias: true,
                            fit: BoxFit.cover,
                            participants.user.avatarUrl,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
