import 'package:floor/floor.dart';
import 'package:bisnisku/app/data/entities/order_detail.dart';

@dao
abstract class OrderDetailDao{
  @insert
  Future<void> insertMenu(OrderDetail orderDetail);

  @delete
  Future<void> deleteMenu(OrderDetail orderDetail);

  @update
  Future<void> updateMenu(OrderDetail orderDetail);

  @Query('SELECT * FROM order_detail')
  Future<List<OrderDetail?>> getMenus();

  @Query('SELECT * FROM order_detail WHERE id = :id')
  Future<OrderDetail?> getMenuById(int id);

}