import 'package:fwc_2022/app/core/ui/mixins/loader.dart';
import 'package:fwc_2022/app/core/ui/mixins/message.dart';
import 'package:get/get.dart';
import '../../core/rest_client/rest_client.dart';
import '../../repository/bet/bet_repository.dart';

class NewBetController extends GetxController with LoaderMixin, MessagesMixin {
  final BetRepository _betRepository;

  NewBetController({required BetRepository betRepository})
      : _betRepository = betRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  String? validateName(String? value) {
    String v = value!.trim();
    if (v.length < 3 || v.isEmpty) {
      return "Nome muito curto.";
    }
    return null;
  }

  Future<void> createBet(String title) async {
    try {
      _loading.toggle();
      await _betRepository.createBet(title.trim());
      _loading.toggle();

      _message(MessageModel(
        message: 'Bolão foi cadastrado',
        type: MessageType.info,
      ));
    } on RestClientException catch (e, _) {
      _loading.toggle();
      _message(MessageModel(
        message: e.message,
        type: MessageType.error,
      ));
    } catch (e, _) {
      _loading.toggle();
      _message(MessageModel(
        message: "Erro ao criar o bolão",
        type: MessageType.error,
      ));
    }
  }
}
