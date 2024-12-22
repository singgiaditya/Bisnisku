import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bisnisku/app/data/dao/menu_dao.dart';
import 'package:bisnisku/app/data/database.dart';
import 'package:bisnisku/app/data/entities/menu.dart';
import 'package:bisnisku/app/global/services/image_picker_service.dart';
import 'package:bisnisku/app/injection_container.dart';
import 'package:bisnisku/app/modules/product/views/add_product_view.dart';

class ProductController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final CurrencyTextInputFormatter priceFormatter =
      CurrencyTextInputFormatter.currency(
    minValue: 0,
    decimalDigits: 0,
    locale: "ID",
    symbol: "Rp. ",
  );
  final CurrencyTextInputFormatter hppFormatter =
      CurrencyTextInputFormatter.currency(
          minValue: 0, decimalDigits: 0, locale: "ID", symbol: "Rp. ");

  var image = File('').obs;

  var isLoading = false.obs;

  var menuList = <Menu?>[].obs;

  void getMenu() {
    final AppDatabase database = sl();
    final MenuDao menuDao = database.menuDao;
    menuDao.getAllMenu().then((value) {
      menuList.value = value;
    });
  }

  void addProductView() {
    Get.to(() => const AddProductView());
  }

  void saveProduct() async {
    isLoading.value = true;
    final AppDatabase database = sl();
    final MenuDao menuDao = database.menuDao;
    try {
      if (nameController.text.isNotEmpty &&
          priceFormatter.getDouble() > 0 &&
          hppFormatter.getDouble() > 0) {
        var imageBytes = null;
        if (image.value.path.isNotEmpty) {
          imageBytes = await image.value.readAsBytes();
        }
        final Menu menu = Menu(
            name: nameController.text,
            price: priceFormatter.getDouble(),
            hpp: hppFormatter.getDouble(),
            image: imageBytes);
        await menuDao.insertMenu(menu);
        nameController.clear();
        image.value = File('');
        getMenu();
        isLoading.value = false;
        Get.back();
        Get.snackbar("Add Product", "Success Add Product",
            isDismissible: true, colorText: Colors.white);
      } else {
        Get.snackbar("Add Product", "Please fill all the field",
            isDismissible: true, colorText: Colors.white);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      Get.snackbar("Add Product", "Something went wrong",
          isDismissible: true, colorText: Colors.white);
    }
  }

  Future<void> chooseImageFile(BuildContext context) async {
    ImagePickerService service = ImagePickerService();
    var imageSelected = await service.pickImageFromGalleryOrCamera(context);
    if (imageSelected != null) {
      image.value = File(imageSelected.path);
    }
  }

  @override
  void onInit() {
    getMenu();
    super.onInit();
  }
}
