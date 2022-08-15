import 'package:get/get.dart';

import 'package:flower_app/app/modules/all/bindings/all_binding.dart';
import 'package:flower_app/app/modules/all/views/all_view.dart';
import 'package:flower_app/app/modules/date_picker/bindings/date_picker_binding.dart';
import 'package:flower_app/app/modules/date_picker/views/date_picker_view.dart';
import 'package:flower_app/app/modules/home/bindings/home_binding.dart';
import 'package:flower_app/app/modules/home/views/home_view.dart';
import 'package:flower_app/app/modules/main/bindings/main_binding.dart';
import 'package:flower_app/app/modules/main/views/main_view.dart';
import 'package:flower_app/app/modules/pgview/bindings/pgview_binding.dart';
import 'package:flower_app/app/modules/pgview/views/pgview_view.dart';
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
  ];
}
