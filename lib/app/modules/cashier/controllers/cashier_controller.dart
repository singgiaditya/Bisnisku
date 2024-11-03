import 'package:get/get.dart';
import 'package:myapp/app/data/dao/menu_dao.dart';
import 'package:myapp/app/data/database.dart';
import 'package:myapp/app/data/entities/menu.dart';
import 'package:myapp/app/data/models/cart_model.dart';
import 'package:myapp/app/injection_container.dart';

class CashierController extends GetxController {
  var menuList = <Menu?>[].obs;
  var cartItems = <CartModel?>[].obs;
  var totalItem = 0.obs;
  var totalPrice = 0.0.obs;

  void getTotal() {
    double priceTotal = 0;
    int itemTotal = 0;
    for (var item in cartItems) {
      priceTotal += item!.menu.price * item.quantity;
      itemTotal += item.quantity;
    }
    totalPrice.value = priceTotal;
    totalItem.value = itemTotal;
  }

  void addItem(Menu menu) {
    bool isExist = false;
    for (var item in cartItems) {
      if (item!.menu.id == menu.id) {
        isExist = true;
        item.quantity++;
        break;
      }
    }

    if (!isExist) {
      final CartModel selectedItem = CartModel(menu: menu, quantity: 1);
      cartItems.add(selectedItem);
    }
    getTotal();
    print("total item: ${totalItem.value}");
    print("total price: ${totalPrice.value}");
  }

  void removeItem(CartModel item) {
    cartItems.remove(item);
  }

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
