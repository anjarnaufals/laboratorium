// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:flower_app/app/utils/theme_data.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    _MyApp(),
  );
}

class _MyApp extends StatelessWidget {
  const _MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flower Appx",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      builder: EasyLoading.init(),
    );
  }
}
