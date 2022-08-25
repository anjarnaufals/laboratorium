import 'package:flower_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AllController extends GetxController {
  var listMenu = <Menu>[
    Menu(menu: "Filter", route: Routes.HOME),
    Menu(menu: "Stack", route: Routes.MAIN),
    Menu(menu: "TextField", route: Routes.TEXTFIELD),
    Menu(menu: "Date Picker", route: Routes.DATE_PICKER),
    Menu(menu: "Menu with pageview", route: Routes.PGVIEW),
    Menu(menu: "Custom Button", route: Routes.CUSTOMBUTTON),
    Menu(menu: "Simple Slider", route: Routes.SLIDER),
    Menu(menu: "Bubble", route: Routes.BUBBLE),
    Menu(menu: "Example", route: Routes.EXAMPLE),
  ];

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
}

class Menu {
  String menu;
  String route;

  Menu({required this.menu, required this.route});
}
