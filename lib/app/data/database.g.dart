// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MenuDao? _menuDaoInstance;

  FinancialDao? _financialDaoInstance;

  OrderDao? _orderDaoInstance;

  OrderDetailDao? _orderDetailDaoInstance;

  PaymentMethodDao? _paymentMethodDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `menu` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `price` REAL NOT NULL, `hpp` REAL NOT NULL, `image` BLOB)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `financial` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `type` TEXT NOT NULL, `description` TEXT NOT NULL, `amount` REAL NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `order` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `customer` TEXT NOT NULL, `buy_at` INTEGER NOT NULL, `payment_method_id` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `order_detail` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `order_id` INTEGER NOT NULL, `menu_id` INTEGER NOT NULL, `quantity` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `payment_method` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `payment_method` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MenuDao get menuDao {
    return _menuDaoInstance ??= _$MenuDao(database, changeListener);
  }

  @override
  FinancialDao get financialDao {
    return _financialDaoInstance ??= _$FinancialDao(database, changeListener);
  }

  @override
  OrderDao get orderDao {
    return _orderDaoInstance ??= _$OrderDao(database, changeListener);
  }

  @override
  OrderDetailDao get orderDetailDao {
    return _orderDetailDaoInstance ??=
        _$OrderDetailDao(database, changeListener);
  }

  @override
  PaymentMethodDao get paymentMethodDao {
    return _paymentMethodDaoInstance ??=
        _$PaymentMethodDao(database, changeListener);
  }
}

class _$MenuDao extends MenuDao {
  _$MenuDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _menuInsertionAdapter = InsertionAdapter(
            database,
            'menu',
            (Menu item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'hpp': item.hpp,
                  'image': item.image
                }),
        _menuUpdateAdapter = UpdateAdapter(
            database,
            'menu',
            ['id'],
            (Menu item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'hpp': item.hpp,
                  'image': item.image
                }),
        _menuDeletionAdapter = DeletionAdapter(
            database,
            'menu',
            ['id'],
            (Menu item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'hpp': item.hpp,
                  'image': item.image
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Menu> _menuInsertionAdapter;

  final UpdateAdapter<Menu> _menuUpdateAdapter;

  final DeletionAdapter<Menu> _menuDeletionAdapter;

  @override
  Future<List<Menu?>> getAllMenu() async {
    return _queryAdapter.queryList('SELECT * FROM menu',
        mapper: (Map<String, Object?> row) => Menu(
            id: row['id'] as int?,
            name: row['name'] as String,
            price: row['price'] as double,
            hpp: row['hpp'] as double,
            image: row['image'] as Uint8List?));
  }

  @override
  Future<Menu?> getMenuById(int id) async {
    return _queryAdapter.query('SELECT * FROM menu WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Menu(
            id: row['id'] as int?,
            name: row['name'] as String,
            price: row['price'] as double,
            hpp: row['hpp'] as double,
            image: row['image'] as Uint8List?),
        arguments: [id]);
  }

  @override
  Future<void> insertMenu(Menu menu) async {
    await _menuInsertionAdapter.insert(menu, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMenu(Menu menu) async {
    await _menuUpdateAdapter.update(menu, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMenu(Menu menu) async {
    await _menuDeletionAdapter.delete(menu);
  }
}

class _$FinancialDao extends FinancialDao {
  _$FinancialDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _financialInsertionAdapter = InsertionAdapter(
            database,
            'financial',
            (Financial item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'description': item.description,
                  'amount': item.amount
                }),
        _financialUpdateAdapter = UpdateAdapter(
            database,
            'financial',
            ['id'],
            (Financial item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'description': item.description,
                  'amount': item.amount
                }),
        _financialDeletionAdapter = DeletionAdapter(
            database,
            'financial',
            ['id'],
            (Financial item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'description': item.description,
                  'amount': item.amount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Financial> _financialInsertionAdapter;

  final UpdateAdapter<Financial> _financialUpdateAdapter;

  final DeletionAdapter<Financial> _financialDeletionAdapter;

  @override
  Future<List<Financial?>> getAllFinancial() async {
    return _queryAdapter.queryList('SELECT * FROM financial',
        mapper: (Map<String, Object?> row) => Financial(
            id: row['id'] as int,
            type: row['type'] as String,
            description: row['description'] as String,
            amount: row['amount'] as double));
  }

  @override
  Future<Financial?> getMenuById(int id) async {
    return _queryAdapter.query('SELECT * FROM financial WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Financial(
            id: row['id'] as int,
            type: row['type'] as String,
            description: row['description'] as String,
            amount: row['amount'] as double),
        arguments: [id]);
  }

  @override
  Future<void> insertFinancial(Financial financial) async {
    await _financialInsertionAdapter.insert(
        financial, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateFinancial(Financial financial) async {
    await _financialUpdateAdapter.update(financial, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteFinancial(Financial financial) async {
    await _financialDeletionAdapter.delete(financial);
  }
}

class _$OrderDao extends OrderDao {
  _$OrderDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _orderInsertionAdapter = InsertionAdapter(
            database,
            'order',
            (Order item) => <String, Object?>{
                  'id': item.id,
                  'customer': item.customer,
                  'buy_at': _dateTimeConverter.encode(item.buyAt),
                  'payment_method_id': item.paymentMethodId
                }),
        _orderUpdateAdapter = UpdateAdapter(
            database,
            'order',
            ['id'],
            (Order item) => <String, Object?>{
                  'id': item.id,
                  'customer': item.customer,
                  'buy_at': _dateTimeConverter.encode(item.buyAt),
                  'payment_method_id': item.paymentMethodId
                }),
        _orderDeletionAdapter = DeletionAdapter(
            database,
            'order',
            ['id'],
            (Order item) => <String, Object?>{
                  'id': item.id,
                  'customer': item.customer,
                  'buy_at': _dateTimeConverter.encode(item.buyAt),
                  'payment_method_id': item.paymentMethodId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Order> _orderInsertionAdapter;

  final UpdateAdapter<Order> _orderUpdateAdapter;

  final DeletionAdapter<Order> _orderDeletionAdapter;

  @override
  Future<List<Order?>> getAllOrder() async {
    return _queryAdapter.queryList('SELECT * FROM order',
        mapper: (Map<String, Object?> row) => Order(
            id: row['id'] as int,
            customer: row['customer'] as String,
            buyAt: _dateTimeConverter.decode(row['buy_at'] as int),
            paymentMethodId: row['payment_method_id'] as int));
  }

  @override
  Future<Order?> getMenuById(int id) async {
    return _queryAdapter.query('SELECT * FROM order WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Order(
            id: row['id'] as int,
            customer: row['customer'] as String,
            buyAt: _dateTimeConverter.decode(row['buy_at'] as int),
            paymentMethodId: row['payment_method_id'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertOrder(Order order) async {
    await _orderInsertionAdapter.insert(order, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateOrder(Order order) async {
    await _orderUpdateAdapter.update(order, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteOrder(Order order) async {
    await _orderDeletionAdapter.delete(order);
  }
}

class _$OrderDetailDao extends OrderDetailDao {
  _$OrderDetailDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _orderDetailInsertionAdapter = InsertionAdapter(
            database,
            'order_detail',
            (OrderDetail item) => <String, Object?>{
                  'id': item.id,
                  'order_id': item.orderId,
                  'menu_id': item.menuId,
                  'quantity': item.quantity
                }),
        _orderDetailUpdateAdapter = UpdateAdapter(
            database,
            'order_detail',
            ['id'],
            (OrderDetail item) => <String, Object?>{
                  'id': item.id,
                  'order_id': item.orderId,
                  'menu_id': item.menuId,
                  'quantity': item.quantity
                }),
        _orderDetailDeletionAdapter = DeletionAdapter(
            database,
            'order_detail',
            ['id'],
            (OrderDetail item) => <String, Object?>{
                  'id': item.id,
                  'order_id': item.orderId,
                  'menu_id': item.menuId,
                  'quantity': item.quantity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<OrderDetail> _orderDetailInsertionAdapter;

  final UpdateAdapter<OrderDetail> _orderDetailUpdateAdapter;

  final DeletionAdapter<OrderDetail> _orderDetailDeletionAdapter;

  @override
  Future<List<OrderDetail?>> getMenus() async {
    return _queryAdapter.queryList('SELECT * FROM order_detail',
        mapper: (Map<String, Object?> row) => OrderDetail(
            id: row['id'] as int,
            orderId: row['order_id'] as int,
            menuId: row['menu_id'] as int,
            quantity: row['quantity'] as int));
  }

  @override
  Future<OrderDetail?> getMenuById(int id) async {
    return _queryAdapter.query('SELECT * FROM order_detail WHERE id = ?1',
        mapper: (Map<String, Object?> row) => OrderDetail(
            id: row['id'] as int,
            orderId: row['order_id'] as int,
            menuId: row['menu_id'] as int,
            quantity: row['quantity'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertMenu(OrderDetail orderDetail) async {
    await _orderDetailInsertionAdapter.insert(
        orderDetail, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMenu(OrderDetail orderDetail) async {
    await _orderDetailUpdateAdapter.update(
        orderDetail, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMenu(OrderDetail orderDetail) async {
    await _orderDetailDeletionAdapter.delete(orderDetail);
  }
}

class _$PaymentMethodDao extends PaymentMethodDao {
  _$PaymentMethodDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _paymentMethodInsertionAdapter = InsertionAdapter(
            database,
            'payment_method',
            (PaymentMethod item) => <String, Object?>{
                  'id': item.id,
                  'payment_method': item.paymentMethod
                }),
        _paymentMethodUpdateAdapter = UpdateAdapter(
            database,
            'payment_method',
            ['id'],
            (PaymentMethod item) => <String, Object?>{
                  'id': item.id,
                  'payment_method': item.paymentMethod
                }),
        _paymentMethodDeletionAdapter = DeletionAdapter(
            database,
            'payment_method',
            ['id'],
            (PaymentMethod item) => <String, Object?>{
                  'id': item.id,
                  'payment_method': item.paymentMethod
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PaymentMethod> _paymentMethodInsertionAdapter;

  final UpdateAdapter<PaymentMethod> _paymentMethodUpdateAdapter;

  final DeletionAdapter<PaymentMethod> _paymentMethodDeletionAdapter;

  @override
  Future<List<PaymentMethod?>> getAllPaymentMethod() async {
    return _queryAdapter.queryList('SELECT * FROM payment_method',
        mapper: (Map<String, Object?> row) => PaymentMethod(
            id: row['id'] as int,
            paymentMethod: row['payment_method'] as String));
  }

  @override
  Future<PaymentMethod?> getPaymentMethodById(int id) async {
    return _queryAdapter.query('SELECT * FROM payment_method WHERE id = ?1',
        mapper: (Map<String, Object?> row) => PaymentMethod(
            id: row['id'] as int,
            paymentMethod: row['payment_method'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertPaymentMethod(PaymentMethod paymentMethod) async {
    await _paymentMethodInsertionAdapter.insert(
        paymentMethod, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePaymentMethod(PaymentMethod paymentMethod) async {
    await _paymentMethodUpdateAdapter.update(
        paymentMethod, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePaymentMethod(PaymentMethod paymentMethod) async {
    await _paymentMethodDeletionAdapter.delete(paymentMethod);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
