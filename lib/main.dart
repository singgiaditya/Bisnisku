import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/global/theme/my_theme.dart';
import 'package:myapp/app/injection_container.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await sl.allReady();
  runApp(
    GetMaterialApp(
      title: "Cafeku",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      darkTheme: Themes.dark,
    ),
  );
}
