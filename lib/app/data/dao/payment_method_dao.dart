import 'package:floor/floor.dart';
import 'package:bisnisku/app/data/entities/payment_method.dart';

@dao
abstract class PaymentMethodDao {
  @insert
  Future<void> insertPaymentMethod(PaymentMethod paymentMethod);

  @delete
  Future<void> deletePaymentMethod(PaymentMethod paymentMethod);

  @update
  Future<void> updatePaymentMethod(PaymentMethod paymentMethod);

  @Query('SELECT * FROM payment_method')
  Future<List<PaymentMethod?>> getAllPaymentMethod();

  @Query('SELECT * FROM payment_method WHERE id = :id')
  Future<PaymentMethod?> getPaymentMethodById(int id);
}
