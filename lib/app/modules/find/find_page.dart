import 'package:flutter/material.dart';
import 'package:fwc_2022/app/core/ui/fwc_state.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_appbar.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_button.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_textformfield.dart';
import 'package:fwc_2022/app/modules/find/find_controller.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends FWCState<FindPage, FindController> {
  final _formKey = GlobalKey<FormState>();
  final _codeEC = TextEditingController();

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
        child: Form(
          key: _formKey,
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
              FWCTextFormField(
                label: "Qual o código do bolão?",
                controller: _codeEC,
                validator: (value) {
                  return controller.validateCode(value);
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FWCButton(
                label: "BUSCAR BOLÃO",
                onPressed: () {
                  final formState = _formKey.currentState!.validate();
                  if (formState) {
                    controller.joinBet(_codeEC.text);
                    _codeEC.clear();
                  }
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _codeEC.dispose();
  }
}
