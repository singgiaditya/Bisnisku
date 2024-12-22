import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bisnisku/app/data/dao/payment_method_dao.dart';
import 'package:bisnisku/app/data/database.dart';
import 'package:bisnisku/app/data/entities/payment_method.dart';
import 'package:bisnisku/app/injection_container.dart';

class PaymentMethodController extends GetxController {
  var paymentMethodList = <PaymentMethod?>[].obs;

  void getPaymentMethod() {
    final AppDatabase database = sl();
    final PaymentMethodDao paymentMethodDao = database.paymentMethodDao;
    paymentMethodDao.getAllPaymentMethod().then((value) {
      paymentMethodList.value = value;
    });
  }

  void insertPaymentMethod(String payment) async {
    final AppDatabase database = sl();
    final PaymentMethodDao paymentMethodDao = database.paymentMethodDao;
    try {
      final PaymentMethod paymentMethod = PaymentMethod(paymentMethod: payment);
      await paymentMethodDao.insertPaymentMethod(paymentMethod);
      getPaymentMethod();
      Get.back();
      Get.snackbar("Add Payment Method", "Success Add Payment Method",
          isDismissible: true, colorText: Colors.white);
    } on Exception catch (e) {
      Get.snackbar("Add Payment Method", "Something went wrong",
          isDismissible: true, colorText: Colors.white);
    }
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
