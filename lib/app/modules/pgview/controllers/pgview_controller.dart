import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PgviewController extends GetxController {
  final menus = <Menu>[
    Menu(id: 0, menu: Icons.home),
    Menu(id: 1, menu: Icons.notifications),
    Menu(id: 2, menu: Icons.person),
  ];

  final pageController = PageController();
  var index = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void changeMenu(int i) {
    index.value = i;
    pageController.jumpToPage(i);
  }
}

class Menu {
  int id;
  IconData menu;

  Menu({required this.id, required this.menu});
}
