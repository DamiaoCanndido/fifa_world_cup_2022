import 'package:get/get.dart';

class GuessController extends GetxController {
  final _activePage = RxString("guesses");

  String get activePage => _activePage.value;

  void setActivePageGuess() {
    _activePage("guesses");
  }

  void setActivePageRank() {
    _activePage("ranking");
  }
}
