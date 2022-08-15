import 'package:flower_app/app/modules/pgview/views/example_home_view.dart';
import 'package:get/get.dart';

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
