import 'package:flutter/material.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_appbar.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_button.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_textformfield.dart';

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FWCAppBar(
        centerTitle: true,
        title: const Text("Buscar por código"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Encontre um bolão através de seu código único",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const FWCTextFormField(
              label: "Qual o código do bolão?",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FWCButton(
              label: "BUSCAR BOLÃO",
              onPressed: () {},
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
