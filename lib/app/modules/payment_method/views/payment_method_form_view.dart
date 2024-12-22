import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bisnisku/app/global/theme/my_text.dart';
import 'package:bisnisku/app/global/widgets/custom_field.dart';
import 'package:bisnisku/app/modules/payment_method/controllers/payment_method_controller.dart';

class PaymentMethodFormView extends GetView<PaymentMethodController> {
  const PaymentMethodFormView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Payment Method',
            style: titleTextStyle,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                CustomField(
                  label: "Name Payment Method",
                  hintText: "Cash",
                  controller: nameController,
                ),
                SizedBox(
                  height: 14,
                ),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                         controller.insertPaymentMethod(nameController.text);
                      },
                      child: Text(
                        "Save Product",
                        style: subtitleTextStyle,
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
