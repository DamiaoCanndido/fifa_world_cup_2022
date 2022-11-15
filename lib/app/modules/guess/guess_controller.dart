import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fwc_2022/app/core/ui/mixins/loader.dart';
import 'package:get/get.dart';
import '../../core/ui/mixins/message.dart';
import '../../models/bet_model.dart';
import '../../models/guess_model.dart';
import '../../repository/guess/guess_repository.dart';

class GuessController extends GetxController with LoaderMixin, MessagesMixin {
  final GuessRepository _guessRepository;

  GuessController({required GuessRepository guessRepository})
      : _guessRepository = guessRepository;

  final _betModel = Rx<BetModel>(Get.arguments["betModel"]);
  BetModel get betModel => _betModel.value;

  final guesses = <GuessModel>[].obs;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final _activePage = RxString("guesses");

  String get activePage => _activePage.value;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    try {
      _loading.toggle();
      getMyGuesses();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();
      log(
        'Erro ao buscar jogos e palpites',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<void> getMyGuesses() async {
    final allGuesses = await _guessRepository.getMyGuesses(betModel.id);
    debugPrint(allGuesses.length.toString());
    guesses.assignAll(allGuesses);
  }

  void setActivePageGuess() {
    _activePage("guesses");
  }

  void setActivePageRank() {
    _activePage("ranking");
  }
}
