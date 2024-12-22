import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bisnisku/app/global/theme/my_text.dart';
import 'package:bisnisku/app/modules/payment_method/views/payment_method_form_view.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Obx(
                () {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.paymentMethodList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          trailing: GestureDetector(
                              onTap: () {
                                Get.bottomSheet(Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Colors.white,
                                    ),
                                    child: Wrap(
                                      children: [
                                        ListTile(
                                          leading: Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ),
                                          title: Text(
                                            "Edit",
                                            style: normalTextStyle.copyWith(
                                                color: Colors.black),
                                          ),
                                        ),
                                        ListTile(
                                          onTap: () {
                                            Get.defaultDialog(
                                                titlePadding:
                                                    EdgeInsets.only(top: 20),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .symmetric(
                                                            vertical: 20),
                                                confirm: FilledButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStatePropertyAll<
                                                                  Color>(
                                                              Colors.red),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Confirm",
                                                      style: normalTextStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    )),
                                                cancel: OutlinedButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Cancel",
                                                      style: normalTextStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    )),
                                                title: "Delete",
                                                titleStyle: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                content: Text(
                                                  "Are you sure to delete this data ?",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ));
                                            // Get.back();
                                          },
                                          leading: Icon(
                                            Icons.delete,
                                            color: Colors.black,
                                          ),
                                          title: Text(
                                            "Delete",
                                            style: normalTextStyle.copyWith(
                                                color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                              },
                              child: Icon(Icons.more_horiz)),
                          title: Text(
                            controller.paymentMethodList[index]!.paymentMethod,
                            style: subtitleTextStyle,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
