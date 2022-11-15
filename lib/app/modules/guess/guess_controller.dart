import 'package:get/get.dart';
import '../../models/bet_model.dart';

class GuessController extends GetxController {
  final _betModel = Rx<BetModel>(Get.arguments["betModel"]);
  BetModel get betModel => _betModel.value;

  final _activePage = RxString("guesses");

  String get activePage => _activePage.value;

  void setActivePageGuess() {
    _activePage("guesses");
  }

  void setActivePageRank() {
    _activePage("ranking");
  }
}
