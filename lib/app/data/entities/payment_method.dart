import 'package:floor/floor.dart';

@Entity(tableName: "payment_method")
class PaymentMethod {
  @PrimaryKey(autoGenerate: true)
  final int id;
  @ColumnInfo(name: "payment_method")
  final String paymentMethod;

  PaymentMethod({required this.id, required this.paymentMethod});
}
