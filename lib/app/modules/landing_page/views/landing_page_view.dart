import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bisnisku/app/global/theme/my_color.dart';

import '../controllers/landing_page_controller.dart';

class LandingPageView extends GetView<LandingPageController> {
  const LandingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.index.value,
            selectedItemColor: primary,
            onTap: (value) => controller.changePage(value),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cashier"),
              BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
            ],
          ),
        ),
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: controller.pages.first,
          onGenerateRoute: controller.onGenerateRoute,
        ));
  }
}
