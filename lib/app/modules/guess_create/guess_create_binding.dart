import 'package:get/get.dart';
import '../../repository/guess/guess_repository.dart';
import '../../repository/guess/guess_repository_impl.dart';
import 'guess_create_controller.dart';

class GuessCreateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuessRepository>(
      () => GuessRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<GuessCreateController>(
      () => GuessCreateController(
        guessRepository: Get.find<GuessRepository>(),
      ),
    );
  }
}
