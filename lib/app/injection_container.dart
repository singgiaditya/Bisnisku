import 'package:get_it/get_it.dart';
import 'package:bisnisku/app/data/database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingletonAsync<AppDatabase>(() async {
    final database =
        await $FloorAppDatabase.databaseBuilder("cafeku_database.db").build();
    return database;
  });
}
