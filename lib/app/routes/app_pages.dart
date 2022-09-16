// Package imports:
import 'package:flower_app/app/modules/AutoRefresh/views/auto_refresh_view_lvl2.dart';
import 'package:flower_app/app/modules/AutoRefresh/views/auto_refresh_view_lvl3.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:flower_app/app/modules/AutoRefresh/bindings/auto_refresh_binding.dart';
import 'package:flower_app/app/modules/AutoRefresh/views/auto_refresh_view.dart';
import 'package:flower_app/app/modules/all/bindings/all_binding.dart';
import 'package:flower_app/app/modules/all/views/all_view.dart';
import 'package:flower_app/app/modules/bubble/bindings/bubble_binding.dart';
import 'package:flower_app/app/modules/bubble/views/bubble_view.dart';
import 'package:flower_app/app/modules/cart/bindings/cart_binding.dart';
import 'package:flower_app/app/modules/cart/views/cart_view.dart';
import 'package:flower_app/app/modules/custombutton/bindings/custombutton_binding.dart';
import 'package:flower_app/app/modules/custombutton/views/custombutton_view.dart';
import 'package:flower_app/app/modules/date_picker/bindings/date_picker_binding.dart';
import 'package:flower_app/app/modules/date_picker/views/date_picker_view.dart';
import 'package:flower_app/app/modules/example/bindings/example_binding.dart';
import 'package:flower_app/app/modules/example/views/example_view.dart';
import 'package:flower_app/app/modules/home/bindings/home_binding.dart';
import 'package:flower_app/app/modules/home/views/home_view.dart';
import 'package:flower_app/app/modules/main/bindings/main_binding.dart';
import 'package:flower_app/app/modules/main/views/main_view.dart';
import 'package:flower_app/app/modules/pgview/bindings/pgview_binding.dart';
import 'package:flower_app/app/modules/pgview/views/pgview_view.dart';
import 'package:flower_app/app/modules/slider/bindings/slider_binding.dart';
import 'package:flower_app/app/modules/slider/views/slider_view.dart';
import 'package:flower_app/app/modules/textfield/bindings/textfield_binding.dart';
import 'package:flower_app/app/modules/textfield/views/textfield_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ALL;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.ALL,
      page: () => AllView(),
      binding: AllBinding(),
    ),
    GetPage(
      name: _Paths.TEXTFIELD,
      page: () => TextfieldView(),
      binding: TextfieldBinding(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: _Paths.DATE_PICKER,
      page: () => DatePickerView(),
      binding: DatePickerBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PGVIEW,
      page: () => PgviewView(),
      binding: PgviewBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: _Paths.CUSTOMBUTTON,
      page: () => CustombuttonView(),
      binding: CustombuttonBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: _Paths.EXAMPLE,
      page: () => ExampleView(),
      binding: ExampleBinding(),
    ),
    GetPage(
      name: _Paths.SLIDER,
      page: () => SliderView(),
      binding: SliderBinding(),
      transition: Transition.values[10],
    ),
    GetPage(
      name: _Paths.BUBBLE,
      page: () => BubbleView(),
      binding: BubbleBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.AUTO_REFRESH,
      page: () => AutoRefreshView(),
      binding: AutoRefreshBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: _Paths.AUTO_REFRESH_LVL2,
      page: () => AutoRefreshLvl2(),
      binding: AutoRefreshBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.AUTO_REFRESH_LVL3,
      page: () => AutoRefreshLvl3(),
      // binding: AutoRefreshBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
