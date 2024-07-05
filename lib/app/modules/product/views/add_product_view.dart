import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/global/theme/my_text.dart';
import 'package:myapp/app/modules/product/controllers/product_controller.dart';

class AddProductView extends GetView<ProductController> {
  const AddProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
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
              customField(label: "Name Product", hintText: "Cappucino", isNumber: false,),
              SizedBox(
                height: 14,
              ),
              customField(label: "Selling Price", hintText: "25000", isNumber: true,),
              SizedBox(
                height: 14,
              ),
              customField(label: "HPP Product", hintText: "15000", isNumber: true,),
              SizedBox(
                height: 20,
              ),
              PhotoField(),
              SizedBox(height: 40,),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text("Save Product", style: subtitleTextStyle,),))
            ],
          ),
        ),
      ),
    );
  }
}

class customField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isNumber;
  const customField({
    super.key, required this.label, required this.hintText, required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: subtitleTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          style: normalTextStyle,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}

class PhotoField extends StatelessWidget {
  const PhotoField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.image,
            color: Colors.white,
            size: 80,
          ),
          Container(
              height: 30,
              padding: EdgeInsets.only(right: 24),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                  ),
                  child: Text(
                    "Choose Photo",
                    style: normalTextStyle,
                  ))),
        ],
      ),
    );
  }
}
