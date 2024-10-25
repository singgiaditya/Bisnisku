import 'package:floor/floor.dart';
import 'package:myapp/app/data/models/menu.dart';
import 'package:myapp/app/data/models/order.dart';

@Entity(tableName: "order_detail")
class OrderDetail {
  @PrimaryKey(autoGenerate: true)
  final int id;
  @ForeignKey(childColumns: ['order_id'], parentColumns: ['id'], entity: Order)
  @ColumnInfo(name: "order_id")
  final int orderId;
  @ForeignKey(childColumns: ['menu_id'], parentColumns: ['id'], entity: Menu)
  @ColumnInfo(name: "menu_id")
  final int menuId;
  @ColumnInfo(name: "quantity")
  final int quantity;

  OrderDetail(
      {required this.id,
      required this.orderId,
      required this.menuId,
      required this.quantity});

  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
        id: map['id'],
        orderId: map['order_id'],
        menuId: map['menu_id'],
        quantity: map['quantity']);
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'order_id': orderId,
      'menu_id': menuId,
      'quantity': quantity,
    };
  }
}
