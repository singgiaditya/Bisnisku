import 'package:floor/floor.dart';

const income = 'Income';
const expense = 'expense';

@Entity(tableName: "financial")
class Financial {
  @PrimaryKey(autoGenerate: true)
  final int id;
  @ColumnInfo(name: "type")
  final String type;
  @ColumnInfo(name: "description")
  final String description;
  @ColumnInfo(name: "amount")
  final double amount;

  Financial({required this.id, required this.type, required this.description, required this.amount});

  factory Financial.fromMap(Map<String, dynamic> map){
    return Financial(
      id: map['id'],
      type: map['type'],
      description: map['description'],
      amount: map['amount'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'type': type,
      'description': description,
      'amount': amount,
    };
  }

}
