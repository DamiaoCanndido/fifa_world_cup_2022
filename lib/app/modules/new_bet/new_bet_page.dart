import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_button.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_textformfield.dart';

class NewBetPage extends StatelessWidget {
  const NewBetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/images/logo.svg",
              height: 50,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Crie seu próprio bolão da copa \n e compartilhe entre amigos!",
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
              label: "Qual o nome do seu bolão?",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FWCButton(
              label: "CRIAR SEU BOLÃO",
              onPressed: () {},
              width: double.infinity,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Após criar o seu bolão, você receberá \n um código único que poderá usar  para convidar outras pessoas",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
