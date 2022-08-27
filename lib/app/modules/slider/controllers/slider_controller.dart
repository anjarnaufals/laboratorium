import 'package:get/get.dart';

class SliderController extends GetxController {
  var number = 20.0.obs;

  var min = 0.0.obs;
  var max = 100.0.obs;

  final sliderValue = 0.0.obs;
  final rangeSliderMinValue = 0.0.obs;
  final rangeSliderMaxValue = 0.0.obs;

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

  void commitSlider(double value, double min, double max) {
    sliderValue.value = value;
    rangeSliderMinValue.value = min;
    rangeSliderMaxValue.value = max;
  }
}
