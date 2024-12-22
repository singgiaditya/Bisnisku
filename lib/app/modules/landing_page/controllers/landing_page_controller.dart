import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bisnisku/app/modules/cashier/bindings/cashier_binding.dart';
import 'package:bisnisku/app/modules/cashier/views/cashier_view.dart';
import 'package:bisnisku/app/modules/home/bindings/home_binding.dart';
import 'package:bisnisku/app/modules/home/views/home_view.dart';
import 'package:bisnisku/app/modules/store/bindings/store_binding.dart';
import 'package:bisnisku/app/modules/store/views/store_view.dart';
import 'package:bisnisku/app/routes/app_pages.dart';

class LandingPageController extends GetxController {
  //TODO: Implement LandingPageController

  final index = 0.obs;

  final pages = <String>[Routes.HOME, Routes.CASHIER, Routes.SETTING];

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
        page: () => StoreView(),
        binding: StoreBinding(),
      );

    return null;
  }

  void changePage(int selectedIndex) {
    index.value = selectedIndex;
    Get.keys[1]?.currentState!.pushReplacementNamed(pages[index.value]);
  }
}
