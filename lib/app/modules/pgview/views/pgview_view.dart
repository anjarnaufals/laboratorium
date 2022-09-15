// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flower_app/app/modules/pgview/views/example_home_view.dart';
import 'package:flower_app/app/modules/pgview/views/example_notif_view.dart';
import 'package:flower_app/app/modules/pgview/views/example_profile_view.dart';
import 'package:flower_app/app/utils/style.dart';
import '../controllers/pgview_controller.dart';

class PgviewView extends GetView<PgviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            ExHomeView(),
            ExNotifView(),
            ExProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
              height: kToolbarHeight,
              child: Row(
                children:
                    controller.menus.map((e) => _CustomMenuItem(e)).toList(),
              ))),
      floatingActionButton: _BackButton(),
    );
  }
}

class _CustomMenuItem extends GetWidget<PgviewController> {
  final Menu e;
  const _CustomMenuItem(
    this.e, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeMenu(e.id);
      },
      child: Container(
          color: Colors.transparent,
          width: Get.width / 3,
          height: kToolbarHeight,
          child: Stack(alignment: Alignment.center, children: [
            Icon(e.menu),
            Positioned(
                top: Get.width / 81,
                left: Get.width / 6,
                child: Container(
                    constraints: BoxConstraints(minHeight: 20, minWidth: 20),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.only(top: 3, right: 3, left: 3),
                    child: Text(
                      "99",
                      style: textWhite(size: 10),
                      textAlign: TextAlign.center,
                    )))
          ])),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Get.theme.primaryColor,
              Get.theme.primaryColorLight,
              Get.theme.primaryColorDark,
            ]),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Icon(
              Icons.close_fullscreen,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
