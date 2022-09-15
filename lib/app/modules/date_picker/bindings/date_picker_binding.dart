// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../controllers/date_picker_controller.dart';

class DatePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatePickerController>(
      () => DatePickerController(),
    );
  }
}
