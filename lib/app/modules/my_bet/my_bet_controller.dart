import 'dart:developer';
import 'package:fwc_2022/app/core/ui/mixins/loader.dart';
import 'package:get/get.dart';
import '../../models/bet_model.dart';
import '../../repository/bet/bet_repository.dart';

class MyBetController extends GetxController with LoaderMixin {
  final BetRepository _betRepository;

  MyBetController({required BetRepository betRepository})
      : _betRepository = betRepository;

  final bets = <BetModel>[].obs;
  final _loading = false.obs;

  @override
  void onInit() {
    loaderListener(_loading);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    try {
      _loading.toggle();
      getMyBets();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();
      log(
        'Erro ao buscar ligas',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<void> getMyBets() async {
    final allLeagues = await _betRepository.getMyBets();
    bets.assignAll(allLeagues);
  }

  Future<void> refreshPage() async {
    try {
      getMyBets();
    } catch (e, s) {
      log(
        'Erro ao buscar bolões',
        error: e,
        stackTrace: s,
      );
    }
  }
}
