// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../controllers/slider_controller.dart';

class SliderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliderController>(
      () => SliderController(),
    );
  }
}
