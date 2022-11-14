import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_button.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_textformfield.dart';
import 'package:fwc_2022/app/modules/new_bet/new_bet_controller.dart';
import 'package:get/get.dart';

class NewBetPage extends GetView<NewBetController> {
  const NewBetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _newBetEC = TextEditingController();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
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
              FWCTextFormField(
                label: "Qual o nome do seu bolão?",
                controller: _newBetEC,
                validator: (value) {
                  return controller.validateName(value);
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FWCButton(
                label: "CRIAR SEU BOLÃO",
                onPressed: () {
                  final formState = _formKey.currentState!.validate();
                  if (formState) {
                    controller.createBet(_newBetEC.text);
                    _newBetEC.clear();
                  }
                },
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
      ),
    );
  }
}
