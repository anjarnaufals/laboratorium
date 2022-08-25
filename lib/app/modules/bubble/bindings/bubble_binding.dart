import 'package:get/get.dart';

import '../controllers/bubble_controller.dart';

class BubbleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BubbleController>(
      () => BubbleController(),
    );
  }
}
