import 'package:floor/floor.dart';
import 'package:bisnisku/app/data/entities/menu.dart';

@dao
abstract class MenuDao{
  @insert
  Future<void> insertMenu(Menu menu);

  @delete
  Future<void> deleteMenu(Menu menu);

  @update
  Future<void> updateMenu(Menu menu);

  @Query('SELECT * FROM menu')
  Future<List<Menu?>> getAllMenu();

  @Query('SELECT * FROM menu WHERE id = :id')
  Future<Menu?> getMenuById(int id);

}