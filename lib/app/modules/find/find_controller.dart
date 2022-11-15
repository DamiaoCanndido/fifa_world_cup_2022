import 'package:fwc_2022/app/core/ui/mixins/loader.dart';
import 'package:get/get.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/ui/mixins/message.dart';
import '../../repository/find/find_repository.dart';
import '../my_bet/my_bet_controller.dart';

class FindController extends GetxController with LoaderMixin, MessagesMixin {
  final myBets = Get.find<MyBetController>();

  final FindRepository _findRepository;

  FindController({required FindRepository findRepository})
      : _findRepository = findRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  String? validateCode(String? value) {
    String v = value!.trim();
    if (v.length < 6 || v.isEmpty) {
      return "Código muito curto.";
    }
    return null;
  }

  Future<void> joinBet(String code) async {
    try {
      _loading.toggle();
      await _findRepository.joinBet(code.trim());
      await myBets.getMyBets();
      _loading.toggle();

      _message(MessageModel(
        message: 'Você foi adicionado ao bolão',
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
        message: "Erro ao tentar entrar no bolão",
        type: MessageType.error,
      ));
    }
  }
}
