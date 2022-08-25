import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bubble_controller.dart';

class BubbleView extends GetView<BubbleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BubbleView'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          color: Colors.amber[100],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  controller.getKordinat(controller.keyTest);
                },
                child: Text(
                  "${controller.coordinatText}",
                  style: TextStyle(color: Colors.red),
                  key: controller.keyTest,
                ),
              ),
              Obx(() => Container(
                    constraints: BoxConstraints(
                        minHeight: Get.width / 1.5 - 100,
                        minWidth: Get.width / 1.5 - 100),
                    color: Colors.blue[100],
                    child: CustomPaint(
                      painter: MyBubble(),
                      child:
                          Center(child: Text("This is child of Custom Paint")),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class MyBubble extends CustomPainter {
  final double x = Get.find<BubbleController>().x.value;
  final double y = Get.find<BubbleController>().y.value;
  final double z =
      Get.find<BubbleController>().coordinatText.length.toDouble() * 5;

  void less(x) {}

  @override
  void paint(Canvas canvas, Size size) {
    print(size.height);
    Paint paint0 = Paint()
      ..color = Color.fromARGB(255, 0, 135, 246)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();

    path0.moveTo(0, size.height * 0.1); //titik satu
    path0.lineTo(0, size.height * 0.8); //titik dua
    path0.lineTo(size.width * 1, size.height * 0.8); //titik tiga
    path0.lineTo(size.width * 1, size.height * 0.1); // titik empat
    path0.lineTo(x / size.width + z + 10, size.height * 0.1); // titik lima
    //
    path0.lineTo(x / size.width + z, y / size.height); // titik enam
    path0.lineTo(x / size.width + z - 10, size.height * 0.1); // titik tujuh
    //
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
