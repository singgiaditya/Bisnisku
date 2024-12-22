import 'package:floor/floor.dart';
import 'package:bisnisku/app/data/entities/payment_method.dart';

@Entity(tableName: "order")
class Order {
  @PrimaryKey(autoGenerate: true)
  final int id;
  @ColumnInfo(name: "customer")
  final String customer;
  @ColumnInfo(name: "buy_at")
  final DateTime buyAt;
  @ForeignKey(
      childColumns: ["payment_method_id"],
      parentColumns: ["id"],
      entity: PaymentMethod)
  @ColumnInfo(name: "payment_method_id")
  final int paymentMethodId;

  Order(
      {required this.id,
      required this.customer,
      required this.buyAt,
      required this.paymentMethodId});
}
