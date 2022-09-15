// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flower_app/app/modules/pgview/views/example_home_view.dart';
import '../controllers/pgview_controller.dart';

class PgviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PgviewController>(
      () => PgviewController(),
    );
    Get.lazyPut<ExHomeViewController>(
      () => ExHomeViewController(),
    );
  }
}
