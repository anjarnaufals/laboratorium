import 'package:flower_app/app/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/all_controller.dart';

class AllView extends GetView<AllController> {
  @override
  Widget build(BuildContext context) {
    var menu = controller.listMenu;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Space(),
              _Title(),
              _Space(),
              _Item(menu: menu),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final List<Menu> menu;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: menu.map(
        (e) {
          return Container(
            margin: EdgeInsetsDirectional.all(16),
            decoration: boxDecoration,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  Get.toNamed(e.route);
                },
                child: Container(
                  color: null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    e.menu,
                    style: textWhite(size: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class _Space extends StatelessWidget {
  const _Space({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20);
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Wellcome to Laboratorium",
      style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

BoxDecoration boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(25),
  gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Get.theme.primaryColor,
        Get.theme.primaryColorLight,
        Get.theme.primaryColorDark,
      ]),
);
