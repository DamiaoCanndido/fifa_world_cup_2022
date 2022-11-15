import 'package:get/get.dart';
import '../../repository/guess/guess_repository.dart';
import '../../repository/guess/guess_repository_impl.dart';
import 'guess_controller.dart';

class GuessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuessRepository>(
      () => GuessRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<GuessController>(
      () => GuessController(
        guessRepository: Get.find<GuessRepository>(),
      ),
    );
  }
}
