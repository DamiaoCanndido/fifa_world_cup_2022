import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_button.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_textformfield.dart';
import 'package:fwc_2022/app/models/guess_model.dart';
import 'package:fwc_2022/app/modules/guess/guess_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GuessesList extends GetView<GuessController> {
  const GuessesList({super.key, required this.guesses});

  final List<GuessModel> guesses;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: 150),
        child: ListView.builder(
          primary: true,
          shrinkWrap: true,
          itemCount: guesses.length,
          itemBuilder: (context, index) {
            final guess = guesses[index];
            return Container(
              color: const Color.fromARGB(255, 49, 48, 48),
              margin: const EdgeInsets.all(8),
              height: 180,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "${guess.firstTeamCountryCode} vs ${guess.secondTeamCountryCode}\n ${DateFormat('dd/MM/yyyy E kk:mm').format(guess.date)}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FWCTextFormField(
                          label: "",
                          widthTextField: 40,
                          heightTextField: 40,
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
                        Image.asset(
                          'icons/flags/png/${guess.firstTeamCountryCode.toLowerCase()}.png',
                          package: 'country_icons',
                          height: 30,
                          width: 40,
                        ),
                        Text(
                          guess.guess != null
                              ? guess.guess!.firstTeamPoints.toString()
                              : "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        const Icon(Icons.clear_rounded, color: Colors.white),
                        Text(
                          guess.guess != null
                              ? guess.guess!.secondTeamPoints.toString()
                              : "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Image.asset(
                          'icons/flags/png/${guess.secondTeamCountryCode.toLowerCase()}.png',
                          package: 'country_icons',
                          height: 30,
                          width: 40,
                        ),
                        FWCTextFormField(
                          label: "",
                          widthTextField: 40,
                          heightTextField: 40,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,1}'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: guess.guess != null
                          ? const FWCButton(
                              label: "PALPITE ENVIADO",
                              width: double.infinity,
                              textColor: Colors.white,
                              color: Colors.green,
                            )
                          : guess.isExpired
                              ? const FWCButton(
                                  label: "TEMPO ESGOTADO",
                                  width: double.infinity,
                                  textColor: Colors.white,
                                  color: Colors.green,
                                )
                              : FWCButton(
                                  label: "ENVIAR PALPITE",
                                  width: double.infinity,
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  color: Colors.green,
                                ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
