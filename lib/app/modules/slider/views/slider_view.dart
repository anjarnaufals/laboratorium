import 'package:flower_app/app/data/atom/custom_appbar.dart';
import 'package:flower_app/app/modules/custombutton/views/custombutton_view.dart';
import 'package:flower_app/app/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/slider_controller.dart';

class SliderView extends GetView<SliderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(0, kToolbarHeight),
          child: CustomAppbar(title: "Simple Slider", backButton: true)),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: Get.width,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.blue),
                padding: const EdgeInsets.all(6),
                child: Text(
                  "Slider",
                  style: textWhite(size: 16),
                )),
            Obx(() => GetPlatform.isAndroid
                ? Slider(
                    mouseCursor: MouseCursor.uncontrolled,
                    value: controller.number.value,
                    min: 0,
                    max: 100,
                    onChanged: (Value) {
                      controller.number.value = Value;
                    },
                    onChangeEnd: (RangeValues) {},
                    onChangeStart: (RangeValues) {},
                  )
                : CupertinoSlider(
                    value: controller.number.value,
                    min: 0,
                    max: 100,
                    onChanged: (Value) {
                      controller.number.value = Value;
                    },
                    onChangeEnd: (RangeValues) {},
                    onChangeStart: (RangeValues) {},
                  )),
            Obx(() => Text("Value => ${controller.number.value}")),
            const SizedBox(height: 20),
            Divider(thickness: 1),
            const SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.blue),
                padding: const EdgeInsets.all(6),
                child: Text(
                  "Range Slider",
                  style: textWhite(size: 16),
                )),
            Obx(() => RangeSlider(
                  divisions: 5,
                  min: 0,
                  max: 100,
                  values:
                      RangeValues(controller.min.value, controller.max.value),
                  onChanged: (RangeValues) {
                    controller.min.value = RangeValues.start;
                    controller.max.value = RangeValues.end;
                  },
                )),
            Obx(() => Text("Min Value => ${controller.min.value}")),
            const SizedBox(height: 20),
            Obx(() => Text("Max Value => ${controller.max.value} ")),
            const SizedBox(height: 20),
            Divider(thickness: 1),
            const SizedBox(height: 20),
            CustomButton(
              text: "Confirm Value",
              bgColor: Colors.green,
              ontap: () {
                var value = controller.number.value;
                var min = controller.min.value;
                var max = controller.max.value;
                controller.commitSlider(value, min, max);
              },
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                "Slider Value = ${controller.sliderValue.value.toPrecision(0)}")),
            const SizedBox(height: 20),
            Obx(() => Text(
                "Range Slider Min Value = ${controller.rangeSliderMinValue.value.toPrecision(0)}")),
            const SizedBox(height: 20),
            Obx(() => Text(
                "Range Slider Max Value = ${controller.rangeSliderMaxValue.value.toPrecision(0)}")),
          ],
        ),
      ),
    );
  }
}
