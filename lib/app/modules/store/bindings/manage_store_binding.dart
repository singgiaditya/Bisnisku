import 'package:get/get.dart';

import '../controllers/manage_store_controller.dart';

class ManageStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageStoreController>(
      () => ManageStoreController(),
    );
  }
}
