// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../controllers/custombutton_controller.dart';

class CustombuttonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustombuttonController>(
      () => CustombuttonController(),
    );
  }
}
