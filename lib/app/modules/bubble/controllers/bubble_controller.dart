// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class BubbleController extends GetxController {
  final GlobalKey keyDuit = GlobalKey();
  final GlobalKey keyTest = GlobalKey();

  final String coordinatText = "Rp100.999";

  var x = 0.0.obs;
  var y = 0.0.obs;
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

  void getKordinat(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    Offset? position = box?.localToGlobal(Offset.zero);
    if (position != null) {
      x.value = position.dx;
      print("ini x => ${x + coordinatText.length.toDouble() * 3}");
      y.value = position.dy;
      print("ini y => $y");
    }
  }
}
