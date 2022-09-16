import 'package:flower_app/app/modules/custombutton/views/custombutton_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutoRefreshLvl3 extends StatelessWidget {
  const AutoRefreshLvl3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
            ontap: () {
              Get.back(result: true);
            },
            text: "GetBack To Page 2, result (true)"),
      ),
    );
  }
}
