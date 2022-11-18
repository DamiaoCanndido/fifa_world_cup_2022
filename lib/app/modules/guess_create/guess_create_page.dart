import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fwc_2022/app/core/ui/fwc_state.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_appbar.dart';
import 'package:fwc_2022/app/modules/guess_create/guess_create_controller.dart';
import 'package:intl/intl.dart';
import '../../core/services/team_services.dart';
import '../../core/ui/widgets/fwc_button.dart';
import '../../core/ui/widgets/fwc_textformfield.dart';

class GuessCreate extends StatefulWidget {
  const GuessCreate({super.key});

  @override
  State<GuessCreate> createState() => _GueessCreateState();
}

class _GueessCreateState extends FWCState<GuessCreate, GuessCreateController> {
  final _formKey = GlobalKey<FormState>();
  final _firstTeamPointsEC = TextEditingController();
  final _secondTeamPointsEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FWCAppBar(
        centerTitle: false,
        title: Text(
          "${TeamServices.teamName(controller.guessModel.firstTeamCountryCode)} x ${TeamServices.teamName(controller.guessModel.secondTeamCountryCode)}",
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  DateFormat('dd/MM/yyyy E kk:mm', 'pt_BR').format(
                    controller.guessModel.date,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      'icons/flags/png/${controller.guessModel.firstTeamCountryCode.toLowerCase()}.png',
                      package: 'country_icons',
                    ),
                  ),
                  FWCTextFormField(
                    label: "",
                    controller: _firstTeamPointsEC,
                    validator: (value) {
                      return controller.validateFirstTeamPoints(value);
                    },
                    widthTextField: 60,
                    heightTextField: 60,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,1}'),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      ":",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  FWCTextFormField(
                    label: "",
                    controller: _secondTeamPointsEC,
                    validator: (value) {
                      return controller.validateSecondTeamPoints(value);
                    },
                    widthTextField: 60,
                    heightTextField: 60,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,1}'),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      'icons/flags/png/${controller.guessModel.secondTeamCountryCode.toLowerCase()}.png',
                      package: 'country_icons',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: FWCButton(
                label: "ENVIAR",
                width: double.infinity,
                onPressed: () {
                  final formState = _formKey.currentState!.validate();
                  if (formState) {
                    controller.createGuess(
                      _firstTeamPointsEC.text,
                      _secondTeamPointsEC.text,
                    );
                  }
                },
                textColor: Colors.white,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstTeamPointsEC.dispose();
    _secondTeamPointsEC.dispose();
    super.dispose();
  }
}
