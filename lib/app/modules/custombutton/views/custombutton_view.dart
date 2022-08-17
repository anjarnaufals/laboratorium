import 'package:flower_app/app/data/atom/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/custombutton_controller.dart';

class CustombuttonView extends GetView<CustombuttonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          _Description(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                ontap: () {
                  Get.bottomSheet(Container(
                      color: Colors.blue,
                      height: 100,
                      child: Center(
                          child:
                              Text("This is Feedback ontap Custom Button"))));
                },
                text: 'Custom Button Default Blue',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                ontap: () {
                  Get.bottomSheet(Container(
                      color: Colors.green,
                      height: 100,
                      child: Center(
                          child:
                              Text("This is Feedback ontap Custom Button"))));
                },
                text: 'Custom Button Green',
                bgColor: Colors.green,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                ontap: () {
                  Get.bottomSheet(Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Get.theme.primaryColor,
                            Get.theme.primaryColorLight,
                            Get.theme.primaryColorDark,
                          ])),
                      height: 100,
                      child: Center(
                          child:
                              Text("This is Feedback ontap Custom Button"))));
                },
                text: 'Custom Button Gradient is true , default gradient',
                isGradient: true,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                ontap: () {
                  Get.bottomSheet(Container(
                      color: Colors.amber,
                      height: 100,
                      child: Center(
                          child:
                              Text("This is Feedback ontap Custom Button"))));
                },
                text: 'Custom Button new font color',
                bgColor: Colors.amber,
                fontColor: Colors.black,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                ontap: () {
                  Get.bottomSheet(Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.red,
                            Colors.yellow,
                            Colors.green,
                          ])),
                      height: 100,
                      child: Center(
                          child:
                              Text("This is Feedback ontap Custom Button"))));
                },
                text: 'Custom Button Gradient',
                isGradient: true,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.red,
                      Colors.yellow,
                      Colors.green,
                    ]),
                fontColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function ontap;
  final String text;
  final Color? bgColor;
  final double? width;
  final double? fontSize;
  final Color? fontColor;
  final bool? isGradient;
  final Gradient? gradient;

  const CustomButton({
    Key? key,
    required this.ontap,
    required this.text,
    this.bgColor,
    this.width,
    this.fontSize,
    this.fontColor,
    this.isGradient,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: isGradient == true ? null : bgColor ?? Colors.blue,
        gradient: isGradient == true
            ? gradient ??
                LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Get.theme.primaryColor,
                      Get.theme.primaryColorLight,
                      Get.theme.primaryColorDark,
                    ])
            : null,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          ontap();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5)),
          height: 40,
          width: width ?? Get.width,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.roboto(
                  fontSize: fontSize ?? 14,
                  color: fontColor ?? Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[100], borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: Text(
          " \"This widget is made to be an atomic widget that will be used more than once\" ",
          style: GoogleFonts.roboto(
            height: 1.3,
          ),
        ),
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
      child: CustomAppbar(title: "Custom Button", backButton: true),
    );
  }
}
