import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_button.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_textformfield.dart';

class GuessesList extends StatelessWidget {
  const GuessesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: ListView.builder(
        primary: true,
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder: (context, index) {
          return Container(
            color: const Color.fromARGB(255, 49, 48, 48),
            margin: const EdgeInsets.all(8),
            height: 180,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Text(
                        "Brasil vs Sérvia\n 12 de Novembro de 2022 as 16:00",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FWCTextFormField(
                        label: "",
                        widthTextField: 50,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,1}'),
                          )
                        ],
                      ),
                      Image.asset(
                        'icons/flags/png/br.png',
                        package: 'country_icons',
                        height: 50,
                      ),
                      const SizedBox(
                        height: 60,
                        width: 60,
                        child: Text(""),
                      ),
                      const Icon(Icons.clear_rounded, color: Colors.white),
                      const SizedBox(
                        height: 60,
                        width: 60,
                        child: Text(""),
                      ),
                      Image.asset(
                        'icons/flags/png/rs.png',
                        package: 'country_icons',
                        height: 50,
                      ),
                      FWCTextFormField(
                        label: "",
                        widthTextField: 50,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,1}'),
                          )
                        ],
                      ),
                    ],
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: FWCButton(
                      label: "CONFIRMAR PALPITE",
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
    );
  }
}
