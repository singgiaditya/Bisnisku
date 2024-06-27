import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/global/theme/my_color.dart';
import 'package:myapp/app/global/theme/my_text.dart';

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
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                        hintText: "Find menu",
                        contentPadding: EdgeInsets.only(top: 12), 
                        prefixIcon: Icon(Icons.search, size: 18,)),
                  ),
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(primaryVariant)),
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
                          "0 Items",
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                    Text(
                      "Total: Rp.120.000",
                      style: subtitleTextStyle,
                    )
                  ],
                ))),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return MenuCard();
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
  const MenuCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 95,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSHOX-6JEup_iIkzcdJjTotXqUFvfxUz_d3RJYWlEJNRq76yMxvNdcG05od2z-tb5hiLySqHbvzrlXKoFy2MJfPouQN1g6tQxILjKL74wwFWPMVyma89gKa&usqp=CAE"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
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
                        children: [
                          Text(
                            "Capucinno",
                            style: normalTextStyle.copyWith(
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Rp. 20.000",
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
        ));
  }
}
