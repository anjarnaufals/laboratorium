import 'package:flower_app/app/modules/custombutton/views/custombutton_view.dart';
import 'package:flower_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutoRefreshLvl2 extends GetWidget<AutoRefreshControllerLvl2> {
  const AutoRefreshLvl2({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            ontap: () {
              Get.back(result: true);
            },
            text: "GetBack To Page 1 Result (Default true),",
            bgColor: Colors.cyan,
          ),
          const SizedBox(height: 20),
          Obx(() => Text("data from page 3 = ${c.backLoadLvl3.value}")),
          const SizedBox(height: 20),
          CustomButton(
            ontap: () {
              c.goToNextPageLvl3();
            },
            text: "Go To Next Page 3, await data from page 3",
            bgColor: Colors.red,
          ),
          const SizedBox(height: 20),
          Obx(() => CustomButton(
                ontap: () {
                  Get.back(result: c.backLoadLvl3.value);
                },
                text:
                    "GetBack To Page 1 Result dynamic from page 3 = (${c.backLoadLvl3.value}),",
                bgColor: Colors.green,
              )),
        ],
      ),
    );
  }
}

class AutoRefreshControllerLvl2 extends GetxController {
  var backLoadLvl3 = false.obs;

  Future<void> goToNextPageLvl3() async {
    backLoadLvl3.value = await Get.toNamed(Routes.AUTO_REFRESH_LVL3);
  }
}
