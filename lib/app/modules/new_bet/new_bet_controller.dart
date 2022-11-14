import 'package:get/get.dart';

class NewBetController extends GetxController {
  String? validateName(String? value) {
    String v = value!.trim();
    if (v.length < 3 || v.isEmpty) {
      return "Nome muito curto.";
    }
    return null;
  }
}
