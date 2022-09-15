// Package imports:
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DatePickerController extends GetxController {
  var days = 0.obs;
  var months = 0.obs;
  var years = 0.obs;
  final scrollController = ItemScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
