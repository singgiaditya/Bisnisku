import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/cashier/bindings/cashier_binding.dart';
import 'package:myapp/app/modules/cashier/views/cashier_view.dart';
import 'package:myapp/app/modules/home/bindings/home_binding.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';
import 'package:myapp/app/modules/setting/bindings/setting_binding.dart';
import 'package:myapp/app/modules/setting/views/setting_view.dart';
import 'package:myapp/app/routes/app_pages.dart';

class LandingPageController extends GetxController {
  //TODO: Implement LandingPageController

  final index = 0.obs;

  final pages = <String> [Routes.HOME, Routes.CASHIER, Routes.SETTING ]; 

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.HOME)
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
        binding: HomeBinding(),
      );

    if (settings.name == Routes.CASHIER)
      return GetPageRoute(
        settings: settings,
        page: () => CashierView(),
        binding: CashierBinding(),
      );

    if (settings.name == Routes.SETTING)
      return GetPageRoute(
        settings: settings,
        page: () => SettingView(),
        binding: SettingBinding(),
      );

    return null;
  }


  void changePage(int selectedIndex){
    index.value = selectedIndex;
    Get.keys[1]?.currentState!.pushReplacementNamed(pages[index.value]);
  }

}