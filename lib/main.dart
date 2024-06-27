import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/global/theme/my_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      darkTheme: Themes.dark,
    ),
  );
}
