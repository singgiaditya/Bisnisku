import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/global/theme/my_color.dart';
import 'package:myapp/app/global/theme/my_text.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        controller.addProductView();
      }, child: Icon(Icons.add), shape: CircleBorder(),),
        appBar: AppBar(
          title: Text('Product List', style: titleTextStyle),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                SizedBox(
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
                SizedBox(height: 14,),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                  return MenuCard();
                 },
                ),
                SizedBox(height: 80,),
                
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cappucino",
              style: subtitleTextStyle.copyWith(color: primary),
            ),
            Text(
              "Rp. 25.000",
              style: normalTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
