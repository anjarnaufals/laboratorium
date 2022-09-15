// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../controllers/textfield_controller.dart';

class TextfieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextfieldController>(
      () => TextfieldController(),
    );
  }
}
