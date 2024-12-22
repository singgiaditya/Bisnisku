import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bisnisku/app/global/theme/my_theme.dart';
import 'package:bisnisku/app/injection_container.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await sl.allReady();
  runApp(
    GetMaterialApp(
      title: "Bisnisku",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      darkTheme: Themes.dark,
    ),
  );
}
