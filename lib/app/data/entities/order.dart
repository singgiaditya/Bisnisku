import 'package:floor/floor.dart';

@Entity(tableName: "order")
class Order{
  @PrimaryKey(autoGenerate: true)
  final int id;
  @ColumnInfo(name: "customer")
  final String customer;
  @ColumnInfo(name: "buy_at")
  final DateTime buyAt;

  Order({required this.id, required this.customer, required this.buyAt});
}