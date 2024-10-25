import 'dart:typed_data';

import 'package:floor/floor.dart';

@Entity(tableName: "menu")
class Menu {
  @PrimaryKey(autoGenerate: true)
  int? id;
  @ColumnInfo(name: "name")
  final String name;
  @ColumnInfo(name: "price")
  final double price;
  @ColumnInfo(name: "hpp")
  final double hpp;
  @ColumnInfo(name: "image")
  final Uint8List? image;

  Menu(
      {this.id,
      required this.name,
      required this.price,
      required this.hpp,
      required this.image});

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      hpp: map['hpp'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'hpp': hpp,
      'image': image,
    };
  }
}
