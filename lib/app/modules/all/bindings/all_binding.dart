// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../controllers/all_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllController>(
      () => AllController(),
    );
  }
}
