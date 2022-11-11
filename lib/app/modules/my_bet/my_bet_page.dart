import 'package:flutter/material.dart';

import '../../core/ui/widgets/fwc_button.dart';

class MyBetPage extends StatelessWidget {
  const MyBetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          children: [
            FWCButton(
              label: "BUSCAR BOLÃO POR CÓDIGO",
              onPressed: () {},
              width: double.infinity,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
