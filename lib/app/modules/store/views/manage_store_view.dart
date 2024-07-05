import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/global/theme/my_text.dart';
import 'package:myapp/app/modules/store/controllers/manage_store_controller.dart';

class ManageStoreView extends GetView<ManageStoreController> {
  const ManageStoreView({super.key});
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24,),
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: CircleAvatar(radius: 60,)),
                        SizedBox(height: 14,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Store Name", style: subtitleTextStyle,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.white,))
                          ],
                        ),
                        SizedBox(height: 8,),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            style: normalTextStyle,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "My Cafe",
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 14)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Wifi Store", style: subtitleTextStyle,),
                    Switch(value: true, onChanged: (value) => true,)
                  ],
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Wifi Name", style: subtitleTextStyle,),
                        SizedBox(height: 8,),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            style: normalTextStyle,
                            decoration: InputDecoration(
                              hintText: "My Cafe Wifi",
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 14)
                            ),
                          ),
                        ),
                        SizedBox(height: 14,),
                        Text("Wifi Password", style: subtitleTextStyle,),
                        SizedBox(height: 8,),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            style: normalTextStyle,
                            decoration: InputDecoration(
                              hintText: "password",
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 14)
                            ),
                          ),
                        ),
                        SizedBox(height: 14,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(onPressed: (){}, child: Text("Save")))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
        ));
  }
}