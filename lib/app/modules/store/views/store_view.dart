import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/global/theme/my_text.dart';

import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Manage Store',
            style: titleTextStyle,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              MenuListTile(label: "Store", onTap: controller.manageStoreHandler),
              MenuListTile(label: "Product", onTap: controller.productHandler),
              MenuListTile(label: "Financial", onTap: (){}),
              MenuListTile(label: "Backup Data", onTap: (){}),
              MenuListTile(label: "Restore Data", onTap: (){}),
            ],
          ),
        ));
  }
}

class MenuListTile extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const MenuListTile({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Text(
            label,
            style: normalTextStyle,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
