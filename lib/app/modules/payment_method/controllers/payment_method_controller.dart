import 'package:get/get.dart';
import 'package:myapp/app/data/dao/payment_method_dao.dart';
import 'package:myapp/app/data/database.dart';
import 'package:myapp/app/data/entities/payment_method.dart';
import 'package:myapp/app/injection_container.dart';

class PaymentMethodController extends GetxController {
  var paymentMethodList = <PaymentMethod?>[].obs;

  void getPaymentMethod() {
    final AppDatabase database = sl();
    final PaymentMethodDao paymentMethodDao = database.paymentMethodDao;
    paymentMethodDao.getAllPaymentMethod().then((value) {
      paymentMethodList.value = value;
    });
  }

  @override
  void onInit() {
    getPaymentMethod();
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
}
