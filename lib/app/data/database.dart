// database.dart

// required package imports
import 'dart:async';
import 'dart:typed_data';
import 'package:floor/floor.dart';
import 'package:bisnisku/app/data/dao/financial_dao.dart';
import 'package:bisnisku/app/data/dao/menu_dao.dart';
import 'package:bisnisku/app/data/dao/order_dao.dart';
import 'package:bisnisku/app/data/dao/order_detail_dao.dart';
import 'package:bisnisku/app/data/dao/payment_method_dao.dart';
import 'package:bisnisku/app/data/entities/financial.dart';
import 'package:bisnisku/app/data/entities/menu.dart';
import 'package:bisnisku/app/data/entities/order.dart';
import 'package:bisnisku/app/data/entities/order_detail.dart';
import 'package:bisnisku/app/data/entities/payment_method.dart';
import 'package:bisnisku/app/data/type_converter/type_converter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@TypeConverters([DateTimeConverter])
@Database(
  version: 1,
  entities: [Menu, Financial, Order, OrderDetail, PaymentMethod],
)
abstract class AppDatabase extends FloorDatabase {
  MenuDao get menuDao;
  FinancialDao get financialDao;
  OrderDao get orderDao;
  OrderDetailDao get orderDetailDao;
  PaymentMethodDao get paymentMethodDao;
}
