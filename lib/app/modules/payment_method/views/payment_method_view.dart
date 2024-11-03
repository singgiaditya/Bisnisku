import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/global/theme/my_text.dart';
import 'package:myapp/app/modules/payment_method/views/payment_method_form_view.dart';

import '../controllers/payment_method_controller.dart';

class PaymentMethodView extends GetView<PaymentMethodController> {
  const PaymentMethodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Method',
          style: titleTextStyle,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => PaymentMethodFormView());
        },
        child: const Icon(Icons.add),
        shape: CircleBorder(),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: controller.paymentMethodList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.paymentMethodList[index]!.paymentMethod),
              );
            },
          );
        },
      ),
    );
  }
}
