import 'package:get/get.dart';

import '../controllers/textfield_controller.dart';

class TextfieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextfieldController>(
      () => TextfieldController(),
    );
  }
}
