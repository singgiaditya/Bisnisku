import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              customField(
                label: "Name Product",
                hintText: "Cappucino",
                controller: controller.nameController,
              ),
              SizedBox(
                height: 14,
              ),
              NumberField(
                label: "Selling Price",
                hintText: "Rp. 25.000",
                formatter: controller.priceFormatter,
              ),
              SizedBox(
                height: 14,
              ),
              NumberField(
                hintText: "Rp. 15.000",
                label: "HPP Product",
                formatter: controller.hppFormatter,
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.image.value.isAbsolute) {
                  return PhotoFieldWithImage(image: controller.image.value);
                }
                return _buildPhotoField(context);
              }),
              SizedBox(
                height: 40,
              ),
              Obx(
                () {
                  return SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.isLoading.value
                              ? null
                              : controller.saveProduct();
                        },
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Save Product",
                                style: subtitleTextStyle,
                              ),
                      ));
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoField(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.white,
            size: 80,
          ),
          Container(
              height: 30,
              child: ElevatedButton(
                  onPressed: () {
                    controller.chooseImageFile(context);
                  },
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

class customField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  const customField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller});

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
          controller: controller,
          style: normalTextStyle,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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

class NumberField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputFormatter formatter;
  const NumberField({
    super.key,
    required this.label,
    required this.hintText,
    required this.formatter,
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
          inputFormatters: [formatter],
          style: normalTextStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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

class PhotoFieldWithImage extends StatelessWidget {
  final File image;
  PhotoFieldWithImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: Get.size.width - 100,
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: FileImage(image), fit: BoxFit.cover))),
          SizedBox(
            height: 12,
          ),
          Container(
              height: 30,
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
