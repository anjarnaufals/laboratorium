// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../controllers/auto_refresh_controller.dart';

class AutoRefreshBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AutoRefreshController>(
      () => AutoRefreshController(),
    );
  }
}
