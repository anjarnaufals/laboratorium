// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../controllers/bubble_controller.dart';

class BubbleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BubbleController>(
      () => BubbleController(),
    );
  }
}
