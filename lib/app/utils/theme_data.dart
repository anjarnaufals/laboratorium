import 'package:flower_app/app/utils/extensions.dart';
import 'package:flutter/material.dart';

abstract class CustomTheme {
  CustomTheme._();

  static final lightTheme = ThemeData(
    backgroundColor: Colors.grey[100],
    scaffoldBackgroundColor: Colors.white,
    primaryColor: HexColor.fromHex("#12c2e9"),
    primaryColorLight: HexColor.fromHex("#c471ed"),
    primaryColorDark: HexColor.fromHex("#f64f59"),
    brightness: Brightness.light,
    dividerColor: Color.fromARGB(255, 226, 226, 226),
  );

  static final darkTheme = ThemeData(
    backgroundColor: Colors.grey[100],
    scaffoldBackgroundColor: Colors.white,
    primaryColor: HexColor.fromHex("#1565C0"),
    primaryColorLight: HexColor.fromHex("#FF0099"),
    primaryColorDark: HexColor.fromHex("#b92b27"),
    brightness: Brightness.light,
    dividerColor: Color.fromARGB(255, 226, 226, 226),
  );
}
