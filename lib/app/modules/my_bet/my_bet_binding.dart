import 'package:fwc_2022/app/modules/my_bet/my_bet_controller.dart';
import 'package:fwc_2022/app/repository/bet/bet_repository.dart';
import 'package:get/get.dart';

import '../../repository/bet/bet_repository_impl.dart';

class MyBetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetRepository>(
      () => BetRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<MyBetController>(
      () => MyBetController(
        betRepository: Get.find<BetRepository>(),
      ),
    );
  }
}
