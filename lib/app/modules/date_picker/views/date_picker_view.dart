import 'package:flower_app/app/data/atom/custom_appbar.dart';
import 'package:flower_app/app/data/atom/gradient_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/date_picker_controller.dart';

class DatePickerView extends GetView<DatePickerController> {
  //TODO : Date Picker Widget onprogress
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: GradientText(
                  "Date Picker",
                  style: GoogleFonts.roboto(
                    fontSize: 40,
                  ),
                  gradient: linearGradient,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: linearGradient,
              ),
              child: Container(
                height: Get.width,
                color: Colors.black26,
                width: Get.width,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomAppbar(
        title: "Date Picker",
        backButton: true,
      ),
    );
  }
}

LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Get.theme.primaryColor,
      Get.theme.primaryColorLight,
      Get.theme.primaryColorDark,
    ]);
