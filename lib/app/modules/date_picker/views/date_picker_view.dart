import 'package:flower_app/app/data/atom/custom_appbar.dart';
import 'package:flower_app/app/data/atom/gradient_text.dart';
import 'package:flower_app/app/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../controllers/date_picker_controller.dart';

class DatePickerView extends GetView<DatePickerController> {
  //TODO : datepicker on progress
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
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: linearGradient,
                ),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("On Tap");
                      },
                      onVerticalDragEnd: (details) {
                        if (details.primaryVelocity! > 0) {
                          print("Swipe Up");
                        } else if (details.primaryVelocity! < 0) {
                          print("Swipe Bottom");
                        }
                      },
                      child: Container(
                          height: 60,
                          width: 50,
                          color: Colors.white,
                          child: ScrollablePositionedList.builder(
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 20,
                            ),
                            itemScrollController: controller.scrollController,
                            itemPositionsListener:
                                ItemPositionsListener.create(),
                            itemCount: 30,
                            itemBuilder: (_, i) {
                              return Text(
                                "$i",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            },
                          )),
                    )
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: Get.width / 4,
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientText("${controller.days.value}",
                          gradient: linearGradient, style: textWhite(size: 40)),
                      const SizedBox(
                          width: 20, child: Center(child: Text(":"))),
                      GradientText("${controller.months.value}",
                          gradient: linearGradient, style: textWhite(size: 40)),
                      const SizedBox(
                          width: 20, child: Center(child: Text(":"))),
                      GradientText("${controller.years.value}",
                          gradient: linearGradient, style: textWhite(size: 40)),
                    ],
                  )),
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
