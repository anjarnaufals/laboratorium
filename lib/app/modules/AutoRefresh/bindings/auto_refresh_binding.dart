// Package imports:
import 'package:flower_app/app/modules/AutoRefresh/views/auto_refresh_view_lvl2.dart';
import 'package:get/get.dart';

// Project imports:
import '../controllers/auto_refresh_controller.dart';

class AutoRefreshBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AutoRefreshController>(
      () => AutoRefreshController(),
    );
    Get.lazyPut<AutoRefreshControllerLvl2>(
      () => AutoRefreshControllerLvl2(),
    );
  }
}
