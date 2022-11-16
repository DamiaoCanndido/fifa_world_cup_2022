import 'package:fwc_2022/app/models/bet_model.dart';
import 'package:fwc_2022/app/modules/guess/guess_controller.dart';
import 'package:get/get.dart';

import '../../models/guess_model.dart';

class GuessCreateController extends GetxController {
  final betController = Get.find<GuessController>();

  final _guessModel = Rx<GuessModel>(Get.arguments["guess"]);
  GuessModel get guessModel => _guessModel.value;
}
