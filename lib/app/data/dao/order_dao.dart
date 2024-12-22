import 'package:floor/floor.dart';
import 'package:bisnisku/app/data/entities/order.dart';

@dao
abstract class OrderDao{
  @insert
  Future<void> insertOrder(Order order);

  @delete
  Future<void> deleteOrder(Order order);

  @update
  Future<void> updateOrder(Order order);

  @Query('SELECT * FROM order')
  Future<List<Order?>> getAllOrder();

  @Query('SELECT * FROM order WHERE id = :id')
  Future<Order?> getMenuById(int id);

}