import 'package:get/get.dart';

import '../../models/guess_model.dart';

class GuessCreateController extends GetxController {
  final _guessModel = Rx<GuessModel>(Get.arguments["guess"]);
  GuessModel get guessModel => _guessModel.value;
}
