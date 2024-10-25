import 'dart:typed_data';

import 'package:floor/floor.dart';

@Entity(tableName: "menu")
class Menu{
  @PrimaryKey(autoGenerate: true)
  final int id;
  @ColumnInfo(name: "name")
  final String name;
  @ColumnInfo(name: "description")
  final String desription;
  @ColumnInfo(name: "price")
  final double price;
  @ColumnInfo(name: "hpp")
  final double hpp;
  @ColumnInfo(name: "image")
  final Int8List image;

  Menu({required this.id, required this.name, required this.desription, required this.price, required this.hpp, required this.image});

  factory Menu.fromMap(Map<String, dynamic> map){
    return Menu(
      id: map['id'],
      name: map['name'],
      desription: map['desription'],
      price: map['price'],
      hpp: map['hpp'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'desription': desription,
      'price': price,
      'hpp': hpp,
      'image': image,
    };
  }
}

