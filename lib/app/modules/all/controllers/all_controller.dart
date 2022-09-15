// Package imports:
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

// Project imports:
import 'package:flower_app/app/routes/app_pages.dart';

class AllController extends GetxController {
  final listMenu = <Menu>[].obs;
  late RefreshController refreshController;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController();
  }

  @override
  void onReady() {
    super.onReady();
    loadMenu();
  }

  @override
  void onClose() {}

  Future<void> loadMenu() async {
    final loadData = <Menu>[
      Menu(menu: "Filter", route: Routes.HOME),
      Menu(menu: "Stack", route: Routes.MAIN),
      Menu(menu: "TextField", route: Routes.TEXTFIELD),
      Menu(menu: "Date Picker", route: Routes.DATE_PICKER),
      Menu(menu: "Menu with pageview", route: Routes.PGVIEW),
      Menu(menu: "Custom Button", route: Routes.CUSTOMBUTTON),
      Menu(menu: "Simple Slider", route: Routes.SLIDER),
      Menu(menu: "Bubble", route: Routes.BUBBLE),
      Menu(menu: "Cart", route: Routes.CART),
      Menu(menu: "AutoRefresh", route: Routes.AUTO_REFRESH),
      Menu(menu: "Example", route: Routes.EXAMPLE),
    ];

    listMenu.value = loadData;
  }

  Future<void> onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1400));
    refreshController.refreshCompleted();
  }
}

class Menu {
  String menu;
  String route;

  Menu({required this.menu, required this.route});
}
