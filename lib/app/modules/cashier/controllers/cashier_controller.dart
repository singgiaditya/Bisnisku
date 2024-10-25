import 'package:get/get.dart';
import 'package:myapp/app/data/dao/menu_dao.dart';
import 'package:myapp/app/data/database.dart';
import 'package:myapp/app/data/entities/menu.dart';
import 'package:myapp/app/injection_container.dart';

class CashierController extends GetxController {
  var menuList = <Menu?>[].obs;

  void getMenu() {
    final AppDatabase database = sl();
    final MenuDao menuDao = database.menuDao;
    menuDao.getAllMenu().then((value) {
      menuList.value = value;
    });
  }

  @override
  void onInit() {
    getMenu();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
