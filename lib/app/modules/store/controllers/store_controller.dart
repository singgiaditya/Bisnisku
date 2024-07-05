import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

class StoreController extends GetxController {

  void manageStoreHandler(){
    Get.toNamed(Routes.MANAGESTORE);
  }

  void productHandler(){
    Get.toNamed(Routes.PRODUCT);
  }
}
