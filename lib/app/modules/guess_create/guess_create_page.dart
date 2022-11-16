import 'package:flutter/material.dart';
import 'package:fwc_2022/app/core/ui/widgets/fwc_appbar.dart';
import 'package:fwc_2022/app/modules/guess_create/guess_create_controller.dart';
import 'package:get/get.dart';

import '../../core/services/team_services.dart';

class GueessCreate extends GetView<GuessCreateController> {
  const GueessCreate({super.key});

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
      body: Container(),
    );
  }
}
