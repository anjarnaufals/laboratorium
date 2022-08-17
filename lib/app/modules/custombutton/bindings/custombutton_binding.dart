import 'package:get/get.dart';

import '../controllers/custombutton_controller.dart';

class CustombuttonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustombuttonController>(
      () => CustombuttonController(),
    );
  }
}
