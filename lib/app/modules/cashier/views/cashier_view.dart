import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bisnisku/app/data/entities/menu.dart';
import 'package:bisnisku/app/global/theme/my_text.dart';
import 'package:bisnisku/app/modules/cashier/views/order_view.dart';

import '../controllers/cashier_controller.dart';

class CashierView extends GetView<CashierController> {
  const CashierView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: SizedBox(
            height: 35,
            child: TextField(
              style: normalTextStyle,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24)),
                  hintText: "Find menu",
                  contentPadding: EdgeInsets.only(top: 12),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 18,
                  )),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(() {
          return Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const OrderView());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${controller.totalItem.value} Items",
                            style: subtitleTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        "Total: ${CurrencyTextInputFormatter.currency(
                          minValue: 0,
                          decimalDigits: 0,
                          locale: "ID",
                          symbol: "Rp. ",
                        ).formatDouble(controller.totalPrice.value)}",
                        style: subtitleTextStyle,
                      )
                    ],
                  )));
        }),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Obx(
                  () {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.menuList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return MenuCard(
                          onAdd: controller.addItem,
                          data: controller.menuList[index]!,
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ));
  }
}

class MenuCard extends StatelessWidget {
  final Menu data;
  final Function onAdd;
  const MenuCard({
    super.key,
    required this.data,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data.image != null
                ? Container(
                    width: double.infinity,
                    height: 95,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: MemoryImage(data.image!), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                  )
                : Container(
                    width: double.infinity,
                    height: 95,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(
                      Icons.image,
                      size: 40,
                    ),
                  ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data.name}",
                            style: normalTextStyle.copyWith(
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${CurrencyTextInputFormatter.currency(
                              minValue: 0,
                              decimalDigits: 0,
                              locale: "ID",
                              symbol: "Rp. ",
                            ).formatDouble(data.price)}",
                            style: normalTextStyle.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: IconButton.filled(
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)))),
                            onPressed: () {
                              onAdd(data);
                            },
                            icon: Icon(
                              Icons.add,
                              size: 16,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 8)
                ],
              ),
            ),
          ],
        ));
  }
}

class MenuCardLoading extends StatelessWidget {
  const MenuCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 95,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white70),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white70,
                          ),
                          height: 14,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white70,
                          ),
                          height: 14,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: IconButton.filled(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white70),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: 16,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 8)
            ],
          ),
        ),
      ],
    );
  }
}
