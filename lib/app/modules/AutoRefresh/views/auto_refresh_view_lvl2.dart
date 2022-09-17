import 'package:flower_app/app/data/atom/loading_indicator.dart';
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
          const SizedBox(height: 20),
          CustomButton(
            ontap: () {
              c.openMyDialog();
            },
            text: "OPEN DIALOG",
            bgColor: Colors.amber,
            fontColor: Colors.black,
          )
        ],
      ),
    );
  }
}

class _MyDialog extends StatelessWidget {
  const _MyDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            child: CustomButton(
              ontap: () {
                Get.back(result: true, closeOverlays: true);
              },
              text: "CLose dialog, and back to page 1",
              bgColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class AutoRefreshControllerLvl2 extends GetxController {
  var backLoadLvl3 = false.obs;
  var loadDialog = false.obs;

  Future<void> goToNextPageLvl3() async {
    try {
      backLoadLvl3.value = await Get.toNamed(Routes.AUTO_REFRESH_LVL3);
    } catch (e) {
      Get.snackbar(
        "${e.runtimeType}",
        "$e",
        backgroundColor: Colors.red,
      );
    }
  }

  void openMyDialog() {
    loadDialog(true);
    Get.dialog(_LoadDialog());
    Future.delayed(Duration(milliseconds: 1200), () {
      loadDialog(false);
      Get.back();
      Get.dialog(
        _MyDialog(),
      );
    });
  }
}

class _LoadDialog extends StatelessWidget {
  const _LoadDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: 20,
          width: 20,
          child: LoadingIndicator(),
        ),
      ),
    );
  }
}
