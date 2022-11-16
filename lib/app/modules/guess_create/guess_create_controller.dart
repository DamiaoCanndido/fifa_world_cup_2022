import 'package:fwc_2022/app/core/ui/mixins/loader.dart';
import 'package:fwc_2022/app/modules/guess/guess_controller.dart';
import 'package:get/get.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/ui/mixins/message.dart';
import '../../models/guess_model.dart';
import '../../repository/guess/guess_repository.dart';

class GuessCreateController extends GetxController
    with LoaderMixin, MessagesMixin {
  final GuessRepository _guessRepository;

  GuessCreateController({required GuessRepository guessRepository})
      : _guessRepository = guessRepository;

  final guessController = Get.find<GuessController>();

  final _guessModel = Rx<GuessModel>(Get.arguments["guess"]);
  GuessModel get guessModel => _guessModel.value;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  String? validateFirstTeamPoints(String? value) {
    String v = value!.trim();
    if (v.isEmpty) {
      return "";
    }
    return null;
  }

  String? validateSecondTeamPoints(String? value) {
    String v = value!.trim();
    if (v.isEmpty) {
      return "";
    }
    return null;
  }

  Future<void> createGuess(
      String firstTeamPoints, String secondTeamPoints) async {
    try {
      _loading.toggle();
      await _guessRepository.createGuess(
        guessController.betModel.id,
        guessModel.id,
        int.parse(firstTeamPoints.trim()),
        int.parse(secondTeamPoints.trim()),
      );
      await guessController.getMyGuesses();
      _loading.toggle();

      _message(MessageModel(
        message: 'Palpite enviado',
        type: MessageType.info,
      ));
      Get.back();
    } on RestClientException catch (e, _) {
      _loading.toggle();
      _message(MessageModel(
        message: e.message,
        type: MessageType.error,
      ));
    } catch (e, _) {
      _loading.toggle();
      _message(MessageModel(
        message: "Erro ao enviar palpite",
        type: MessageType.error,
      ));
    }
  }
}
