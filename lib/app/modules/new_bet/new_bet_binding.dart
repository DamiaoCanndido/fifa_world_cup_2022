import 'package:get/get.dart';
import '../../repository/bet/bet_repository.dart';
import '../../repository/bet/bet_repository_impl.dart';
import 'new_bet_controller.dart';

class NewBetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetRepository>(
      () => BetRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<NewBetController>(
      () => NewBetController(
        betRepository: Get.find<BetRepository>(),
      ),
    );
  }
}
