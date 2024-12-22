import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bisnisku/app/global/theme/my_text.dart';
import 'package:bisnisku/app/modules/cashier/controllers/cashier_controller.dart';

class OrderView extends GetView<CashierController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Order',
            style: titleTextStyle,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OrderCard();
                    },
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.white70,
                        ),
                    itemCount: 3),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price:",
                      style: normalTextStyle,
                    ),
                    Text(
                      "Rp.60000",
                      style: normalTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Payment Method:",
                  style: normalTextStyle,
                ),
                RadioListTile(
                    value: "cash",
                    groupValue: "cash",
                    onChanged: (value) {},
                    title: Text("Cash")),
                RadioListTile(
                    value: "credit",
                    groupValue: "cash",
                    onChanged: (value) {},
                    title: Text("Credit")),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(12)),
          child: Icon(
            Icons.image,
            size: 40,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Item index",
              style: normalTextStyle,
            ),
            Text(
              "Rp.120000",
              style: smallTextStyle,
            )
          ],
        ),
        Spacer(),
        SizedBox(
          width: 40,
          child: ElevatedButton(
              style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
              onPressed: () {},
              child: Text(
                "-",
                style: subtitleTextStyle,
              )),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "1",
            style: normalTextStyle.copyWith(color: Colors.black),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        SizedBox(
          width: 40,
          child: ElevatedButton(
              style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
              onPressed: () {},
              child: Text(
                "+",
                style: subtitleTextStyle,
              )),
        ),
      ]),
    );
  }
}
