import 'package:floor/floor.dart';
import 'package:bisnisku/app/data/entities/financial.dart';

@dao
abstract class FinancialDao{
  @insert
  Future<void> insertFinancial(Financial financial);

  @delete
  Future<void> deleteFinancial(Financial financial);

  @update
  Future<void> updateFinancial(Financial financial);

  @Query('SELECT * FROM financial')
  Future<List<Financial?>> getAllFinancial();

  @Query('SELECT * FROM financial WHERE id = :id')
  Future<Financial?> getMenuById(int id);

}