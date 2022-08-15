import 'package:flower_app/app/modules/pgview/views/example_home_view.dart';
import 'package:flower_app/app/modules/pgview/views/example_notif_view.dart';
import 'package:flower_app/app/modules/pgview/views/example_profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          onTap: (i) {
            controller.changeMenu(i);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.index.value,
          selectedIconTheme: IconThemeData(color: Get.theme.primaryColorLight),
          items: controller.menus
              .map(
                  (e) => BottomNavigationBarItem(icon: Icon(e.menu), label: ""))
              .toList())),
      floatingActionButton: _BackButton(),
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
