import 'package:get/get.dart';
import 'package:myapp/app/modules/product/views/add_product_view.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  void addProductView(){
    Get.to(AddProductView());
  }
}
