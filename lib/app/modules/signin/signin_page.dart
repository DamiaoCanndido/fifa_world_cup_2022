import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fwc_2022/app/core/constants/constants.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_button.dart';
import 'package:fwc_2022/app/modules/signin/signin_controller.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                height: 50,
              ),
              const SizedBox(
                height: 40,
              ),
              FWCButton(
                label: "ENTRAR COM O GOOGLE",
                color: Colors.red,
                textColor: Colors.white,
                width: double.infinity,
                height: 70,
                onPressed: () {
                  Get.offNamed(Constants.HOME);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Não utilizamos nenhuma informação além do seu e-mail para a criação de sua conta",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
