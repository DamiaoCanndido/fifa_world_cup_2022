import 'package:flutter/material.dart';
import 'package:fwc_2022/app/core/ui/widgets/get_detail.dart';
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
              onPressed: () {},
              width: double.infinity,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 70),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const GetDetail();
              },
            ),
          )
        ],
      ),
    );
  }
}
