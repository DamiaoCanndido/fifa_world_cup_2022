import 'package:get/get.dart';
import '../../repository/find/find_repository.dart';
import '../../repository/find/find_repository_impl.dart';
import 'find_controller.dart';

class FindBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindRepository>(
      () => FindRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<FindController>(
      () => FindController(
        findRepository: Get.find<FindRepository>(),
      ),
    );
  }
}
