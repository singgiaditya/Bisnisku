import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

class StoreController extends GetxController {

  void productHandler(){
    Get.toNamed(Routes.PRODUCT);
  }
}
